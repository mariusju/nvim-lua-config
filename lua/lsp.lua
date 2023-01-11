local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local mason = require('mason')
local mason_lspconfig = require 'mason-lspconfig'
local cmp = require("cmp")
local luasnip = require("luasnip")
local fidget = require('fidget')

mason.setup()
fidget.setup()

cmp.setup({
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    --{ name = 'buffer' },
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    --['<ESC>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
    -- ['<TAB>'] = cmp.mapping.confirm({
    --   behavior = cmp.ConfirmBehavior.Replace,
    --   select = true
    -- }),
  -- ["<Tab>"] = cmp.mapping(function(fallback)
  --     if luasnip.expandable() then  luasnip.expand()
  --     elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
  --     elseif cmp.visible() then cmp.mapping.confirm({
  --       behavior = cmp.ConfirmBehavior.Replace,
  --       select = true
  --       })
  --     else fallback()
  --     end
  --   end, { "i", "s"}),
      ["<Tab>"] = cmp.mapping(
	function(fallback)
	  if cmp.visible() then
	    cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
	  elseif require("luasnip").expand_or_jumpable() then
	    luasnip.expand_or_jump()
	  else
	    fallback()
	  end
	end, { "i", "s" }
      ),
  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
})
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc, silent = true })
  end
  nmap('<leader>k', "<cmd>Lspsaga hover_doc<cr>")
  nmap('<leader>rn', "<cmd>Lspsaga rename<cr>")
  nmap('<leader>ca', "<cmd>Lspsaga code_action<cr>")
  nmap('gd', vim.lsp.buf.definition)

end


local servers = {
  -- tsserver = {},
  sumneko_lua = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      diagnostics = {
	      globals = {"vim"}
      },

    },
  },
}


mason_lspconfig.setup_handlers({
   function (server_name) -- default handler (optional)
       require("lspconfig")[server_name].setup {
	      -- capabilities = capabilities,
	      on_attach = on_attach,
	      settings = servers[server_name],
       }
   end,
})

local saga = require('lspsaga')

saga.init_lsp_saga({
  code_action_keys = {
    quit = '<ESC>',
    exec = '<CR>',
  },
  border_style = "rounded",
  saga_winblend = 0,
  code_action_lightbulb = {
    enable = false,
    enable_in_insert = true,
    cache_code_action = true,
    sign = true,
    update_time = 150,
    sign_priority = 20,
    virtual_text = true,
},
})

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
