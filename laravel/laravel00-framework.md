<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
<style>
  a::after {
    padding: 0 4px;
    content: "\f35d";
    font-family: "Font Awesome 5 Free";
    font-weight: 900;
    font-size: 0.8rem;
  }
  @media print {
    @page { margin: 0; }
    body { margin: 1.6cm; }
  }
  h2 {
    border-left: solid 6px #28a745;
    border-bottom: none!important;
    padding-left: 16px;
    height: 40px!important;
    line-height: 40px!important;
    font-weight: bold!important;
  }
  h3 {
    padding-left: -14px;
    border-bottom: dashed #ccc 1px;
  }
  h3:before {
    content: "■ ";
    color: #17a2b8;
  }
  th, td {
    border: solid 1px #666;
  }
  table {
    margin-bottom: 30px;
  }
  strong {
    color: #f66;
  }
  hr {
    margin-bottom: 30px;
    border-color: #ccc;
  }
  blockquote {
    background: none!important;
    /* font-style: italic; */
    color: #999;
  }
</style>

# Laravel 資料 0 　フレームワーク

## 

本資料ではフレームワークについての説明と用語の整理行う。

## MVCモデル


## 命名規則

## artisanコマンド
職人という意味
### artisanとは
［発音記号ɑ́ːrtəz(ə)n|ɑ̀ːtəzǽn］
「アーティザン」と読む「アルチザン」派も
発音記号に近いのは「アゥリズン」あたりだろうか
Laravelのキャッチコピーが「Web職人のためのフレームワーク」だからか？
Artisan コマンドには雛形作成をはじめ、開発を進める上で便利な機能が用意されている
