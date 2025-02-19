return {
  'f-person/git-blame.nvim',
  event = 'VeryLazy',
  opts = {
    enabled = false,
    message_template = '<author> • <summary> • <date> • <<sha>>',
    date_format = '%m-%d-%Y %I:%M %p',
    virtual_text_column = 1,
  },
}
