// WARNING: Do not manually modify this file. It was generated using:
// https://github.com/dillonkearns/elm-typescript-interop
// Type definitions for Elm ports

export namespace Elm {
  namespace Main {
    export interface App {
      ports: {
        login: {
          subscribe(callback: (data: { name: string; pass: string }) => void): void
        }
        loginSuccess: {
          send(data: { token: string }): void
        }
        loginFailure: {
          send(data: string): void
        }
      };
    }
    export function init(options: {
      node?: HTMLElement | null;
      flags: { window: { width: number; height: number } };
    }): Elm.Main.App;
  }
}