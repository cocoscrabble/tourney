import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    const grid = this.element;
    const columns = [
      {
        prop: 'name',
        name: 'First'
      },
      {
        prop: 'details',
        name: 'Second',
        cellTemplate: (createElement, props) => {
          return createElement('div', {
            style: {
              backgroundColor: 'red'
            },
            class: {
              'inner-cell': true
            }
          }, props.model[props.prop] || '');
        }
      }
    ];
    const rows = [{
      name: 'New item',
      details: 'Item description'
    }];

    grid.columns = columns;
    grid.source = rows;
  }
}
