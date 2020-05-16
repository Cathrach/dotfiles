from beets.plugins import BeetsPlugin
from beets import mediafile

class EventPlugin(BeetsPlugin):
    def __init__(self):
        super(EventPlugin, self).__init__()
        event = mediafile.MediaField(
            mediafile.MP3DescStorageStyle(u'EVENT'),
            mediafile.StorageStyle('EVENT')
        )
        self.add_media_field('event', event)
