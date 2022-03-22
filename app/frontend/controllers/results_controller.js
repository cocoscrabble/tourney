import { Controller } from "@hotwired/stimulus"


function checkbox(createElement, props) {
  const input = createElement("input", {
    type: "checkbox",
    checked: props.model[props.prop],
    onChange(e) {
      props.model[props.prop] = e.target.checked;
      if (input) {
        input.$attrs$.checked = e.target.checked;
      }
      document.getElementById("editgrid").refresh();
    }
  });
  return input;
}

function cellProp({model}) {
  return {
    class: {
      deleted: model['deleted']
    },
  };
}

var editCols = [
  { prop: "division", name: "Division", autoSize: true, cellProperties: cellProp },
  { prop: "round", name: "Round", autoSize: true, cellProperties: cellProp },
  { prop: "player1", name: "Player 1", autoSize: true, cellProperties: cellProp },
  { prop: "score1", name: "Score", autoSize: true, cellProperties: cellProp },
  { prop: "player2", name: "Player 2", autoSize: true, cellProperties: cellProp },
  { prop: "score2", name: "Score", autoSize: true, cellProperties: cellProp },
  { prop: "first", name: "First", autoSize: true, cellProperties: cellProp },
  { prop: "deleted", name: "Delete", size: 100, cellTemplate: checkbox },
];

function newRow() {
  return {
    division: "main",
    round: "",
    player1: "",
    score1: "",
    player2: "",
    score2: "",
    deleted: false
  }
}

export default class extends Controller {

  static targets = ["grid"]
  static values = {
    tournamentid: Number,
    results: Array,
  }

  connect() {
    const grid = this.gridTarget;
    const columns = editCols;
    const rows = this.resultsValue
    grid.columns = columns;
    grid.source = rows;
  }

  addRow() {
    this.gridTarget.source = this.gridTarget.source.concat([newRow()]);
  }

  submit() {
    const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    const url = `/tournaments/${this.tournamentidValue}/results/update_all`;
    const ret = this.gridTarget.source.filter(e => !e.deleted)
    const options = {
      method: 'POST',
      body: JSON.stringify(ret),
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': token,
      }
    }
    fetch(url, options)
      .then(res => res.json())
      .then(res => this.gridTarget.source = res);
  }
}

