//= require jquery

import '@hotwired/turbo-rails';
import 'controllers';

import { tableSort } from './table/sort.js';

$('.sortable').on('click', tableSort);

$(document).on('click', '.page-link', function (e) {
  e.preventDefault();
  const page = $(this).data('page');
  const itemsPerPage = $('#itemsPerPageSelect').val();

  // Redirecionar para a página correspondente
  window.location.href =
    '/orders?page=' + page + '&itemsPerPage=' + itemsPerPage;
});

$('#itemsPerPageSelect').on('change', function (e) {
  e.preventDefault();
  const page = $(this).data('page');
  const itemsPerPage = $('#itemsPerPageSelect').val();

  // Redirecionar para a página correspondente
  window.location.href =
    '/orders?page=' + page + '&itemsPerPage=' + itemsPerPage;
});
