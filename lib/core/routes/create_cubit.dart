import 'package:bright/core/api/dio_consumer.dart';
import 'package:bright/core/repositories/auth_repo.dart';
import 'package:bright/core/repositories/course_repo.dart';
import 'package:bright/core/repositories/instructor_repo.dart';
import 'package:bright/core/repositories/profile_repo.dart';
import 'package:bright/features/auth/cubit/auth_cubit.dart';
import 'package:bright/features/course/cubit/course_cubit.dart';
import 'package:bright/features/instructor/cubit/instructor_cubit.dart';
import 'package:bright/core/services/service_locator.dart';
import 'package:bright/features/profile/cubit/profile_cubit.dart';

// Use shared instance of Dio and DioConsumer from Service Locator.
final DioConsumer _dioConsumer = getIt<DioConsumer>();

AuthCubit createAuthCubit() => AuthCubit(AuthRepo(api: _dioConsumer));

InstructorCubit createInstructorCubit() =>
    InstructorCubit(InstructorRepo(api: _dioConsumer));

CourseCubit createCourseCubit() => CourseCubit(CourseRepo(api: _dioConsumer));

ProfileCubit createProfileCubit() =>
    ProfileCubit(ProfileRepo(api: _dioConsumer));
