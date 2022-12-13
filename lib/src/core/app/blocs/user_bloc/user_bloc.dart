// import 'dart:async';
//
// import 'package:equatable/equatable.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../data/repository/user_repository/interface.dart';
// import '../../../utils/enums/status.dart';
// import '../../locator/app_locator.dart';
//
// part 'user_event.dart';
// part 'user_state.dart';
//
// class UserBloc extends Bloc<UserEvent, UserState> {
//   final UserRepositoryInterface repo;
//
//   UserBloc({UserRepositoryInterface? repository})
//       : repo = repository ?? locator<UserRepositoryInterface>(),
//         super(UserState()) {
//     on<UserFetched>(_fetchUser);
//     on<UserCartItemRemoved>(_removeCartItem);
//     on<UserCartItemAdded>(_addCartItem);
//     on<UserCartChanged>(_changeUserCart);
//   }
//
//   FutureOr<void> _fetchUser(
//     UserFetched event,
//     Emitter<UserState> emit,
//   ) async {
//     User user = await repo.getUser();
//     emit(state.copyWith(
//       user: user,
//       status: StateStatus.loaded,
//     ));
//   }
//
//   void _removeCartItem(
//     UserCartItemRemoved event,
//     Emitter<UserState> emit,
//   ) {
//     List<CartItem> newCart = state.user?.cart ?? [];
//
//     newCart.remove(event.cartItem);
//     emit(
//       state.copyWith(
//         user: state.user?.copyWith(cart: newCart),
//       ),
//     );
//   }
//
//   void _addCartItem(
//     UserCartItemAdded event,
//     Emitter<UserState> emit,
//   ) {
//     List<CartItem> newCart = state.user?.cart ?? [];
//     CartItem cartItem = event.cartItem;
//
//     if (newCart.contains(cartItem)) {
//       final int index = newCart.indexWhere((element) => element == cartItem);
//       int newQuantity = cartItem.quantity;
//       cartItem = cartItem.copyWith(
//         quantity: ++newQuantity,
//       );
//       newCart.remove(cartItem);
//       newCart.replaceRange(index, index, [cartItem]);
//     }
//
//     newCart.add(event.cartItem);
//
//     emit(
//       state.copyWith(
//         user: state.user?.copyWith(cart: newCart),
//       ),
//     );
//   }
//
//   void _changeUserCart(
//     UserCartChanged event,
//     Emitter<UserState> emit,
//   ) {
//     emit(state.copyWith(
//         user: state.user?.copyWith(
//       cart: event.cart,
//     )));
//   }
// }
