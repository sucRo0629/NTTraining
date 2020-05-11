// 5-2
function showDetail() {
  // 要素のdisplayを変更する方法
  document.getElementById('detail').style.display = 'block';

  // 要素を追加削除する方法
  document.getElementById('detail2').innerHTML = '産地: 青森県<br>糖度: 13度';
}
function hideDetail() {
  // 要素のdisplayを変更する方法
  document.getElementById('detail').style.display = 'none';

  // 要素を追加削除する方法
  document.getElementById('detail2').innerHTML = '';
}

// 5-3
function dispRenban() {
  const times = document.getElementById('input').value;

  let renban = '連番:';
  for (i = 1; i <= times; i++) {
    renban += i;
    alert(renban);
    renban += ',';
  }
}

// 5-4
function dispRenban5_4() {
  const times = document.getElementById('input').value;

  if (!/^[0-9]+$/.test(times)) {
    alert('数値を正しく入力してください');
    return;
  }

  let renban = '連番:';
  for (i = 1; i <= times; i++) {
    renban += i;
    alert(renban);
    renban += ',';
  }
}
