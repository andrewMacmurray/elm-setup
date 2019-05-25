import { Elm } from "../elm/Main";

const app = Elm.Main.init({
  node: document.querySelector("main"),
  flags: {
    window: windowDimensions()
  }
});

app.ports.login.subscribe(user => {
  app.ports.loginSuccess.send({
    token: `${user.name}-token-123`
  });
});

function windowDimensions(): { width: number; height: number } {
  return {
    width: window.innerWidth,
    height: window.innerHeight
  };
}
