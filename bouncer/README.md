# bouncer

The app should be a simplified version of the classic `90s bouncing ball game`, where the player's objective is to destroy all `blocks` in the screen and prevent the `ball` from touching the bottom of the screen as it moves around, for that you will have to use the phone's `accelerometer` to control the `player's tile`.

### Rules of the game

- The `ball` moves in a linear manner and changes direction when it hits a `wall`, a `block` or the `player's tile`. The direction change happens by this [rule](https://www.toppr.com/ask/en-af/question/1865186/): the degree it came with should be the degree it goes out, similar to real-life experience.
- All `blocks` disappear when they are hit by the `ball`.
- You lose the game when the `ball` touches the bottom part of the screen, and a "You lost!" message is displayed.
- You win the game when all `blocks` are destroyed, and a "You Won!" message is displayed.
- The `player's tile` moves according to the phone's tiltiness. If the phone is tilted more towards the right side, so does the tile, the same with the left side.
- When the `player's tile` reaches the end of the display, it should never go off the end of the display's dimensions.

Here's an example:

<center>
<img src="./resources/bouncer.01.jpg?raw=true" style = "width: 420px !important; height: 210px !important;"/>
</center>

