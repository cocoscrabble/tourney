import GridController from "./grid_controller";


export default class extends GridController {

  cols() {
    return [
      { prop: "division", name: "Division"},
      { prop: "round", name: "Round"},
      { prop: "player1", name: "Player 1"},
      { prop: "score1", name: "Score"},
      { prop: "player2", name: "Player 2"},
      { prop: "score2", name: "Score"},
      { prop: "first", name: "First"},
    ];
  }

  newRow() {
    return {
      division: "main",
      round: "",
      player1: "",
      score1: "",
      player2: "",
      score2: "",
    }
  }
}
