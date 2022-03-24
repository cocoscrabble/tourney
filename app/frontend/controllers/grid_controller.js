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

function makeCol(e) {
  return {autoSize: true, cellProperties: cellProp, ...e}
}

function makeCols(cols) {
  return cols.map(makeCol).concat([
    { prop: "deleted", name: "Delete", size: 100, cellTemplate: checkbox }
  ])
}

export default class extends Controller {

  static targets = ["grid"]
  static values = {
    submitUrl: String,
    rows: Array,
  }

  connect() {
    const grid = this.gridTarget;
    grid.columns = makeCols(this.cols());
    grid.source = this.rowsValue;
    console.log(grid.columns);
  }

  addRow() {
    const grid = this.gridTarget;
    const new_row = {...this.newRow(), deleted: false}
    grid.source = grid.source.concat([new_row]);
  }

  submit() {
    const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    const url = this.submitUrlValue;
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
