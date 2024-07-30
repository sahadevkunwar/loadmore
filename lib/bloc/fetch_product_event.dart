abstract class ProductDetailEvent {}

class FetchProductEvent extends ProductDetailEvent {
  int makeId;

  FetchProductEvent({required this.makeId});
}

class LoadMoreProductEvent extends ProductDetailEvent {
  int makeId;
  LoadMoreProductEvent({required this.makeId});
}
