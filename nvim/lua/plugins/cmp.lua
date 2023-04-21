local keys = require("utils.global-keys-mapping").cmp
return {{
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineChanged" },
  dependencies = {
    -- sources
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    -- snippet plugin
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",
    "rafamadriz/friendly-snippets",
  },
  keys = {
    { keys.select_next_item, "<C-n>", mode = "c", desc = "Cmd-cmp select next item", remap = true, silent = true },
    { keys.select_prev_item, "<C-p>", mode = "c", desc = "Cmd-cmp select prev item", remap  =true, silent = true },
  },
  opts = function()
    local cmp = require("cmp")
    local feedkey = function(key, mode)
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
    end

    local mapping = {
      [keys.complete] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      [keys.abort] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      [keys.confirm] = cmp.mapping.confirm({
        select = true,
        behavior = cmp.ConfirmBehavior.Replace,
      }),
      [keys.scroll_doc_up] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
      [keys.scroll_doc_down] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
      [keys.select_prev_item] = cmp.mapping.select_prev_item(),
      [keys.select_next_item] = cmp.mapping.select_next_item(),

      ["<A-l>"] = cmp.mapping(function(_)
        if vim.fn["vsnip#available"](1) == 1 then
          feedkey("<Plug>(vsnip-expand-or-jump)", "")
        end
      end, {"i", "s"}),

      ["<A-h>"] = cmp.mapping(function()
        if vim.fn["vsnip#jumpable"](-1) == 1 then
          feedkey("<Plug>(vsnip-jump-prev)", "")
        end
      end, {"i", "s"}),
    }
    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
          { name = 'cmdline' }
        })
    })

    cmp.setup.filetype({ "markdown", "help", "gitcommit" }, {
      window = {
        documentation = cmp.config.disable,
      },
      sources = { {
        name = "luasnip",
      }, {
          name = "buffer",
        }, {
          name = "path",
        } },
    })

    return {
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = mapping,
      sources = cmp.config.sources({
        {
          name = "nvim_lsp",
          group_index = 1,
        },
        {
          name = "vsnip",
          group_index = 2,
        },
        {
          name = "buffer",
          group_index = 3,
        },
        {
          name = "path",
          group_index = 3,
        },
      }),
    }
  end
}}
