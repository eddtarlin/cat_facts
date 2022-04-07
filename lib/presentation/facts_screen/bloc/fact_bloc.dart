import 'package:bloc/bloc.dart';
import 'package:cat_fact/config/config_import.dart';
import 'package:cat_fact/data/data_import.dart';
import 'package:meta/meta.dart';
import 'package:hive/hive.dart';

part 'fact_event.dart';
part 'fact_state.dart';

class FactBloc extends Bloc<FactEvent, FactState> {
  final FactsRepository _factsRepository;
  FactBloc(
    final FactsRepository factsRepository,
  )   : _factsRepository = factsRepository,
        super(FactInitial()) {
    on<GetRandomCatFact>((event, emit) async {
      emit(FactLoading());
      final CatFact catFact = await _factsRepository.getRandomCatFact();
      final String catImage = _factsRepository.getRandomCatImage();
      final String newGeneratedImage =
          '${catImage}?${DateTime.now().millisecondsSinceEpoch.toString()}';
      emit(RandomCatFact(catFact: catFact, image: newGeneratedImage));
    });
    on<SaveCatFact>((event, emit) async {
      Box<CatFact> factsBox = Hive.box<CatFact>(DbPath.factsDb);
      factsBox.add(event.catFact);
    });
  }
}
