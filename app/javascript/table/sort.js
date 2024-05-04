export function tableSort() {
  const columnIndex = $(this).index(); // Define Index da Tabela.
  const currentOrder = $(this).data('order') || 'asc'; // Verifica a atual ordenação (Caso nula => asc).
  const newOrder = currentOrder === 'asc' ? 'desc' : 'asc'; // Cria a nova ordenação baseada na anterio.

  $('.sortable').removeClass('asc desc'); // Remove a classe de ordenação de todas as colunas.
  $('.sortable i').remove(); // Remove a seta de classificação de todas as colunas.

  // Adiciona a classe de ordenação na coluna clicada.
  if (newOrder == 'asc') {
    $(this).append($('<i>').addClass('bi bi-arrow-up'));
  } else {
    $(this).append($('<i>').addClass('bi bi-arrow-down'));
  }

  $(this).addClass(newOrder); // Adicina a Classe a Coluna clicada.
  $(this).data('order', newOrder); // Adicina o tipo de Ordenação do Data da Coluna clicada.

  sortColumn(columnIndex, newOrder); // Chama a Função de Ordenação com os parametros.
}

// Ordena a Coluna Clicada.
function sortColumn(columnIndex, sortOrder) {
  // Seleciona todas as linhas da tabela, exceto o cabeçalho.
  let rows = $('.custom-table tbody tr').get();

  // Define a função de comparação com base no tipo de ordenação.
  const compare = (a, b) => {
    const A = defineSortValues($(a).find('td').eq(columnIndex).text());
    const B = defineSortValues($(b).find('td').eq(columnIndex).text());

    if (typeof A === 'string') {
      return sortOrder === 'asc' ? A.localeCompare(B) : B.localeCompare(A);
    } else {
      return sortOrder === 'asc' ? A - B : B - A;
    }
  };

  // Ordena as linhas com base na função de comparação.
  rows.sort(compare);

  // Remove as linhas da tabela.
  $('.custom-table tbody').empty();

  // Adiciona as linhas ordenadas de volta à tabela.
  $.each(rows, function (index, row) {
    $('.custom-table tbody').append(row);
  });
}

// Define os tipos de Dados.
function defineSortValues(value) {
  // Verifica qual tipo de Dado está sendo tratado.
  if (isTime(value)) {
    const [hours, minutes] = value.split(':').map(parseFloat);
    return hours * 60 + minutes;
  } else if (isDate(value)) {
    return Number(value.split('/').reverse().join(''));
  } else if (isNumber(value)) {
    return parseFloat(value.replace(/\./g, '').replace(',', '.'));
  } else {
    return value;
  }
}

// Verifica se o valor é Hora.
function isTime(value) {
  return /^\d{1,2}:\d{2}$/.test(value);
}

// Verifica se o valor é uma Data.
function isDate(value) {
  return /^\d{2}\/\d{2}\/\d{4}$/.test(value);
}

// Verifica se o valor é Número.
function isNumber(value) {
  return !isNaN(parseFloat(value.replace(/\./g, '').replace(',', '.')));
}
