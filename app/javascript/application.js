//= require jquery

import '@hotwired/turbo-rails';
import 'controllers';

import { tableSort } from './table/sort.js';

$('.sortable').click(tableSort);
