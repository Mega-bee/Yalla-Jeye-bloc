import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tip_dialog/tip_dialog.dart';
import 'package:untitled1/home_page/ui/state/loading_home_state.dart';
import 'package:untitled1/module_menu_details/menu_route.dart';
import 'package:untitled1/module_menu_details/repository/menu_details_repository.dart';
import 'package:untitled1/module_menu_details/request/calculate_price_request.dart';
import 'package:untitled1/module_menu_details/response/calculate_response.dart';
import '../../abstracts/states/error_state.dart';
import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';
import '../repository/homepage_repository.dart';
import '../repository/searchTerm_repository.dart';
import '../request/search_terms_request.dart';
import '../response/homepage_response.dart';
import '../response/search_terms_response.dart';
import '../ui/screens/home_page.dart';
import '../ui/screens/search_places.dart';
import '../ui/state/homepage_sucess.dart';
import 'package:rxdart/rxdart.dart';

import '../ui/state/search_place_sucess.dart';

@injectable
class SearchTermsCubit extends Cubit<States> {
  final SearchTermRepository _searchTermRepository;

  SearchTermsCubit(this._searchTermRepository,)
      : super(LoadingState());

  final PublishSubject<String> _cartSubject = PublishSubject<String>();

  Stream<String> get cartStream => _cartSubject.stream;



  SearchTerms(SearcPlacesRequest request, SearchPlacesState screenState) {
    // TipDialogHelper.loading("Loading");
    _searchTermRepository.SearchPlaces(request).then((value) async {
      if (value == null) {
        emit(
          ErrorState(
            errorMessage: 'Connection error',
            retry: () {},
          ),
        );
      } else if(value.code == 200){
        List<SearchTermsModel> search = [];
        for(var item in value.data.insideData){
          search.add(SearchTermsModel.fromJson(item));
        }
        emit(
            SearchPlaceSuccess( screenState,search)
        );
      }
    });
  }
}
