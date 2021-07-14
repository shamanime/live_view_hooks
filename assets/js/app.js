// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import "../css/app.scss"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import deps with the dep name or local files with a relative path, for example:
//
//     import {Socket} from "phoenix"
//     import socket from "./socket"
//
import "phoenix_html"
import {Socket} from "phoenix"
import NProgress from "nprogress"
import {LiveSocket} from "phoenix_live_view"

let Hooks = {}
Hooks.One = {
  mounted() {
    console.log("One mounted...");

    this.handleEvent("one", ({title}) => this.updateTitle(title))
  },
  updateTitle(title) {
    this.el.innerHTML = title;
  }
}

Hooks.Two = {
  mounted() {
    console.log("Two mounted...");

    this.handleEvent("two", ({title}) => this.updateTitle(title))

    this.pushEventTo("#two", "get_title", {});
  },
  updateTitle(title) {
    this.el.innerHTML = title;
  }
}

Hooks.Three = {
  mounted() {
    console.log("Three mounted...");
    this.updateTitle();
  },
  updated() {
    this.updateTitle();
  },
  updateTitle() {
    this.el.innerHTML = this.el.dataset.title;
  }
}

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {hooks: Hooks, params: {_csrf_token: csrfToken}})

// Show progress bar on live navigation and form submits
window.addEventListener("phx:page-loading-start", info => NProgress.start())
window.addEventListener("phx:page-loading-stop", info => NProgress.done())

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket

