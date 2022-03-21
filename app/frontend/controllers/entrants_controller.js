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
  { prop: "player_number", name: "Player #", autoSize: true, cellProperties: cellProp },
  { prop: "userid", name: "Player ID", autoSize: true, cellProperties: cellProp },
  { prop: "name", name: "Name", size: 400, cellProperties: cellProp },
  { prop: "rating", name: "Rating", autoSize: true, cellProperties: cellProp },
  { prop: "deleted", name: "Delete", size: 100, cellTemplate: checkbox },
];

function newRow() {
  return {
    division: "main",
    player_number: "",
    userid: "",
    name: "",
    rating: "",
    deleted: false
  }
}

export default class extends Controller {

  static targets = ["grid"]
  static values = {
    tournamentid: Number,
    entrants: Array,
  }

  connect() {
    const grid = this.gridTarget;
    const columns = editCols;
    const rows = this.entrantsValue
    grid.columns = columns;
    grid.source = rows;
  }

  addRow() {
    this.gridTarget.source = this.gridTarget.source.concat([newRow()]);
  }

  submit() {
    const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    const url = `/tournaments/${this.tournamentidValue}/entrants/update_all`;
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
