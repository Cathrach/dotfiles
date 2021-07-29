-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/cathrach/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/cathrach/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/cathrach/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/cathrach/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/cathrach/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["coc.nvim"] = {
    loaded = true,
    path = "/home/cathrach/.local/share/nvim/site/pack/packer/start/coc.nvim"
  },
  fzf = {
    loaded = true,
    path = "/home/cathrach/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/cathrach/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["lightline.vim"] = {
    loaded = true,
    path = "/home/cathrach/.local/share/nvim/site/pack/packer/start/lightline.vim"
  },
  neorg = {
    config = { "\27LJ\2\2Ð\1\0\0\6\0\14\0\0196\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\f\0005\2\3\0004\3\0\0=\3\4\0024\3\0\0=\3\5\0025\3\t\0005\4\a\0005\5\6\0=\5\b\4=\4\n\3=\3\v\2=\2\r\1B\0\2\1K\0\1\0\tload\1\0\0\21core.norg.dirman\vconfig\1\0\0\15workspaces\1\0\0\1\0\1\fdefault\f~/neorg\24core.norg.concealer\18core.defaults\1\0\0\nsetup\nneorg\frequire\0" },
    loaded = true,
    path = "/home/cathrach/.local/share/nvim/site/pack/packer/start/neorg"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/cathrach/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle" },
    loaded = false,
    needs_bufread = false,
    path = "/home/cathrach/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/cathrach/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/cathrach/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/cathrach/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  sonokai = {
    loaded = true,
    path = "/home/cathrach/.local/share/nvim/site/pack/packer/start/sonokai"
  },
  tagbar = {
    loaded = true,
    path = "/home/cathrach/.local/share/nvim/site/pack/packer/start/tagbar"
  },
  tcomment_vim = {
    loaded = true,
    path = "/home/cathrach/.local/share/nvim/site/pack/packer/start/tcomment_vim"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/cathrach/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/home/cathrach/.local/share/nvim/site/pack/packer/start/vim-easymotion"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/cathrach/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/home/cathrach/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-gutentags"] = {
    loaded = true,
    path = "/home/cathrach/.local/share/nvim/site/pack/packer/start/vim-gutentags"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/home/cathrach/.local/share/nvim/site/pack/packer/start/vim-markdown"
  },
  ["vim-markdown-toc"] = {
    loaded = true,
    path = "/home/cathrach/.local/share/nvim/site/pack/packer/start/vim-markdown-toc"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/cathrach/.local/share/nvim/site/pack/packer/start/vim-surround"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: neorg
time([[Config for neorg]], true)
try_loadstring("\27LJ\2\2Ð\1\0\0\6\0\14\0\0196\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\f\0005\2\3\0004\3\0\0=\3\4\0024\3\0\0=\3\5\0025\3\t\0005\4\a\0005\5\6\0=\5\b\4=\4\n\3=\3\v\2=\2\r\1B\0\2\1K\0\1\0\tload\1\0\0\21core.norg.dirman\vconfig\1\0\0\15workspaces\1\0\0\1\0\1\fdefault\f~/neorg\24core.norg.concealer\18core.defaults\1\0\0\nsetup\nneorg\frequire\0", "config", "neorg")
time([[Config for neorg]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
vim.cmd [[command! -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time([[Defining lazy-load commands]], false)

if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
