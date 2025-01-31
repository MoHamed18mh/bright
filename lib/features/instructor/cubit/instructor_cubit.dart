import 'package:bright/core/repositories/instructor_repo.dart';
import 'package:bright/features/instructor/cubit/instructor_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InstructorCubit extends Cubit<InstructorState> {
  InstructorCubit(this.instructorRepo) : super(InstructorInitial());

  final InstructorRepo instructorRepo;

  Future<void> getInstructors() async {
    emit(InstructorLoadingState());
    final response = await instructorRepo.getInstructors();
    response.fold(
      (errorMessage) => emit(InstructorFailureState()),
      (insturctormodel) =>
          emit(InstructorSuccessState(instructorModel: insturctormodel)),
    );
  }
}
