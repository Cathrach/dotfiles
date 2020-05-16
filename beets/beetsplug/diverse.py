import urllib.request
from w3lib.url import safe_url_string
import urllib.error
from beets.autotag.hooks import AlbumInfo, TrackInfo
from beets import plugins
# from beetsplug import fetchart
from bs4 import BeautifulSoup as bs

DIVERSE_SEARCH = 'https://diverse.direct/?s={0}'
COUNTRY = "Japan"
DATA_SOURCE = "Diverse Direct"


class DiversePlugin(plugins.BeetsPlugin):
    """ Plugin for searching diverse.direct for albums.

    As diverse.direct has no API, this just searches the website for relevant albums. Currently, there is no additional
    configuration. Note that per-track information is unavailable because diverse.direct only categorizes by album.
    """
    def __init__(self):
        super(DiversePlugin, self).__init__()
        # self.register_listener() : if i want to get art (maybe)

    def candidates(self, items, artist, album, va_likely):
        return self._get_results(album)

    def item_candidates(self, item, artist, album):
        """ return candidate tracks for `item`. Only takes first result for `album`. """
        album_url = self._get_results(album)[0]
        return self._get_tracks(album_url)

    def album_for_id(self, album_id):
        """ return AlbumInfo corresponding to `album_id` by scraping the given URL. """
        album_url = album_id
        return self._get_album(album_url)

    def track_for_id(self, track_id):
        """ does nothing because diverse.direct does not support individual tracks. """
        return None

    def _get_results(self, query):
        """ return AlbumInfo objects corresponding to first 2 results for search query `query`. """
        soup = self._open_url(DIVERSE_SEARCH.format(query.replace(" ", "+")))
        results = soup.find(id="index").select("article.post")
        links = [result.find("a").get("href") for result in results]
        links = links[:2]
        results = []
        for link in links:
            album = self._get_album(link)
            if album is not None:
                results.append(album)
        return results

    def _get_album(self, album_url):
        """ return AlbumInfo object corresponding to album linked to by `album_url`. """
        try:
            soup = self._open_url(album_url)
            # catalog number, date (also potentially producer, mastering, etc.)
            meta = soup.find("dl", class_="clearfix")
            catalognum, date = [dd.get_text(strip=True) for dd in meta.find_all("dd")][:2]
            if len(date.split("/")) == 3:
                year, month, day = [int(x) for x in date.split("/")]
            else:
                year, month, day = [int(x) for x in date.split(".")]
            # album/circle information
            album = soup.find(id="single").find(class_="xfd_none").find("h2").get_text(strip=True)
            artist = label = soup.find(class_="cw clearfix").find("a").get_text(strip=True)
            artist_id = album_url[:(album_url.rfind("/", 0, -1) + 1)]
            # discs and tracks
            mediums = len(soup.find("div", class_="left fl").find("ul", class_="clearfix"))
            tracks = self._get_tracks(album_url, soup=soup)
            return AlbumInfo(album, album_url, artist, artist_id, tracks, year=year, month=month, day=day,
                             label=label, mediums=mediums, catalognum=catalognum, country=COUNTRY,
                             data_source=DATA_SOURCE, data_url=album_url)
        except:
            self._log.debug(f"Error while scraping {album_url}")

    def _get_tracks(self, album_url, soup=None):
        """ returns list of TrackInfo objects in album linked to by `album_url`. """
        if soup is None:
            soup = self._open_url(album_url)
        tracks = []
        # separate into discs
        tracklist = soup.find("div", class_="tracklist").find_all("table")
        disctitles = [s.get_text(strip=True) for s in
                      soup.find("div", class_="left fl").find("ul", class_="clearfix").find_all("a")]
        # because diverse.direct only indexes by individual disc
        index = 1
        for medium, table in enumerate(tracklist, start=1):
            medium_total = len(table)
            disctitle = disctitles[medium - 1]
            # process individual discs
            for medium_index, tr in enumerate(table.find_all("tr"), start=1):
                _, title, artist = [s.get_text(strip=True) for s in tr.find_all("td")]
                track = TrackInfo(title, album_url, artist=artist, index=index, medium=medium, medium_index=medium_index,
                              medium_total=medium_total, disctitle=disctitle, data_source=DATA_SOURCE)
                index += 1
                tracks.append(track)
        return tracks

    def _open_url(self, url):
        """ Easy opening of `url` using urllib.request and Beautiful Soup. """
        try:
            safe_url = safe_url_string(url)
            html = urllib.request.urlopen(safe_url)
            soup = bs(html.read(), 'html5lib')
            return soup
        except urllib.error.URLError as e:
            self._log.debug(f"Error encountered while opening {url}: {e}")
