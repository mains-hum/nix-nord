{ config, pkgs, inputs, lib, ... }: {
  programs.nvf = {
    enable = true;
    
    settings.vim.extraPackages = with pkgs; [
      wl-clipboard
      ripgrep
      fd
    ];
    
    settings.vim = {
      viAlias = true;
      vimAlias = true;
      
      ui.colorizer = {
        enable = true;
        setupOpts.user_default_options = {
          mode = "background";
          names = false; 
        };
      };

      statusline.lualine = {
        enable = true;
        setupOpts = {
          options = {
            component_separators = { left = "╱"; right = "╱"; };
            section_separators = { left = ""; right = ""; };
            globalstatus = true;
          };
        };
      };

      luaConfigRC.clipboard = ''
        vim.opt.clipboard = "unnamedplus"
        vim.opt.termguicolors = true 
      '';
      
      luaConfigRC.customColors = ''
        local function apply_nordic_setup()
          local colors = {
            bg      = "#242933",
            bg_dark = "#1e232b",
            fg      = "#eceff4",
            green   = "#a3be8c",
            blue    = "#81a1c1",
            yellow  = "#ebcb8b",
            magenta = "#b48ead",
            cyan    = "#88c0d0",
            grey    = "#4c566a", 
          }

          vim.api.nvim_set_hl(0, "Normal", { fg = colors.fg, bg = "NONE" })
          vim.api.nvim_set_hl(0, "NormalFloat", { bg = colors.bg_dark })
          vim.api.nvim_set_hl(0, "FloatBorder", { fg = colors.cyan, bg = colors.bg_dark })
          vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = colors.bg, bg = "NONE" })
          vim.api.nvim_set_hl(0, "NonText", { fg = colors.bg }) 

          vim.api.nvim_set_hl(0, "Pmenu", { bg = colors.bg_dark, fg = colors.fg })
          vim.api.nvim_set_hl(0, "PmenuSel", { bg = colors.cyan, fg = colors.bg_dark, bold = true })
          vim.api.nvim_set_hl(0, "PmenuSbar", { bg = colors.bg_dark })
          vim.api.nvim_set_hl(0, "PmenuThumb", { bg = colors.grey })

          vim.api.nvim_set_hl(0, "Comment", { fg = colors.grey, italic = true })
          vim.api.nvim_set_hl(0, "Constant", { fg = colors.yellow })
          vim.api.nvim_set_hl(0, "String", { fg = colors.green })
          vim.api.nvim_set_hl(0, "Identifier", { fg = colors.fg })
          vim.api.nvim_set_hl(0, "Function", { fg = colors.blue, bold = true })
          vim.api.nvim_set_hl(0, "Statement", { fg = colors.magenta })
          vim.api.nvim_set_hl(0, "Keyword", { fg = colors.magenta, italic = true })
          vim.api.nvim_set_hl(0, "PreProc", { fg = colors.cyan })
          vim.api.nvim_set_hl(0, "Type", { fg = colors.blue })
          vim.api.nvim_set_hl(0, "Operator", { fg = colors.cyan })

          vim.api.nvim_set_hl(0, "StatusLine", { bg = colors.bg_dark, fg = colors.fg })
          local groups = {"a","b","c","x","y","z"}
          for _, s in ipairs(groups) do
            vim.api.nvim_set_hl(0, "lualine_"..s.."_normal", { bg = colors.bg_dark, fg = colors.fg })
            vim.api.nvim_set_hl(0, "lualine_"..s.."_insert", { bg = colors.bg_dark, fg = colors.cyan })
            vim.api.nvim_set_hl(0, "lualine_"..s.."_visual", { bg = colors.bg_dark, fg = colors.magenta })
          end

          -- NeoTree Customization
          vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE" })
          vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE" })
          vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = colors.blue, bold = true })
          vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = colors.blue })
          vim.api.nvim_set_hl(0, "NeoTreeFileName", { fg = colors.fg })
          vim.api.nvim_set_hl(0, "NeoTreeExpander", { fg = colors.grey })
          vim.api.nvim_set_hl(0, "NeoTreeRootName", { fg = colors.magenta, bold = true })
        end

        vim.api.nvim_create_autocmd("ColorScheme", {
          pattern = "*",
          callback = apply_nordic_setup,
        })
        apply_nordic_setup()
      '';
      
      filetree.neo-tree = {
        enable = true;
        setupOpts.window.width = 30;
      };
      
      telescope.enable = true;
      treesitter = {
        enable = true;
        highlight.enable = true; 
      };
      
      lsp.enable = true;
      autocomplete.nvim-cmp = {
        enable = true;
        mappings = {
          next = "<Tab>";
          previous = "<S-Tab>";
        };
        setupOpts = {
          window = {
            completion = { 
              border = "rounded"; 
              winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None"; 
            };
            documentation = { border = "rounded"; };
          };
        };
      };
      
      git.enable = true;
      autopairs.nvim-autopairs.enable = true;
      binds.whichKey.enable = true;
      lineNumberMode = "relNumber";
      
      maps.normal = {
        "<leader>e" = { action = ":Neotree toggle<CR>"; silent = true; };
        "<leader>ff" = { action = ":Telescope find_files<CR>"; };
        "<C-h>" = { action = "<C-w>h"; };
        "<C-j>" = { action = "<C-w>j"; };
        "<C-k>" = { action = "<C-w>k"; };
        "<C-l>" = { action = "<C-w>l"; };
        "<leader>y" = { action = "\"+y"; };
      };
      maps.visual = {
        "<leader>y" = { action = "\"+y"; };
      };
      maps.insert = { "jk" = { action = "<Esc>"; }; };
    };
  };
}
