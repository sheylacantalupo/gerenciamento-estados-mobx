import 'package:mobx/mobx.dart';
import 'package:panucci_delivery/models/item.dart';

part 'carrinho_store.g.dart';

class CarrinhoStore = _CarrinhoStore with _$CarrinhoStore;

abstract class _CarrinhoStore with Store {
  @observable
  List<Item> listaItem = ObservableList<Item>();

  @observable
  double valorCarrinho = 0;

  @computed
  int get quantidadeItem => listaItem.length;

  @computed
  bool get listaVazia => listaItem.isEmpty;

  // @computed
  // double get valorCarrinho => listaItem.fold(0.0, (total, item) => total + item.preco);

  @action
  void adicionaCarrinho(Item item){
    listaItem.add(item);
    atualizaValorCarrinho();
  }

  @action
  void removeCarrinho(Item item){
    listaItem.remove(item);
    atualizaValorCarrinho();
  }

  @action
  void atualizaValorCarrinho(){
    valorCarrinho = listaItem.fold(0.0, (total, item) => total + item.preco);

  }


}