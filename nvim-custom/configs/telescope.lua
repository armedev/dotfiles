return {
  defaults = {
    mappings = {
      n = {
        ["O"] = require("telescope.actions").cycle_history_next,
        ["o"] = require("telescope.actions").cycle_history_prev,
      }
    },
    layout_config = {
      horizontal = {
        prompt_position = "bottom",
      }
    }
  }
}
