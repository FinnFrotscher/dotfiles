// https://github.com/onivim/oni/wiki/Configuration

const activate = oni => {
    console.log("config activated")
    oni.input.bind("<c-enter>", () => console.log("Control+Enter was pressed"))
}

const deactivate = () => {
    console.log("config deactivated")
}

module.exports = {
    activate,
    deactivate,
    "ui.colorscheme": "nord",
    "oni.bookmarks": ["~/Code","~/dotfiles"],
    "oni.loadInitVim": "/Users/Finn/dotfiles/onivimrc",
    "ui.animations.enabled": true,
    "ui.fontSmoothing": "auto"
}
// hi





