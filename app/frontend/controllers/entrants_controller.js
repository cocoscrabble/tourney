import GridController from "./grid_controller";


export default class extends GridController {

  cols() {
    return [
      { prop: "division", name: "Division"},
      { prop: "player_number", name: "Player #"},
      { prop: "userid", name: "Player ID"},
      { prop: "name", name: "Name"},
      { prop: "rating", name: "Rating"},
    ];
  }

  newRow() {
    return {
      division: "main",
      player_number: "",
      userid: "",
      name: "",
      rating: "",
    }
  }

}
