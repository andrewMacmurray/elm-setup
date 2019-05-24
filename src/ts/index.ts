import { Elm } from "../elm/Main.elm";

Elm.Main.init({
  node: document.querySelector("main"),
  flags: {
    window: windowDimensions()
  }
});

function windowDimensions() {
  return {
    width: window.innerWidth,
    height: window.innerHeight
  };
}
