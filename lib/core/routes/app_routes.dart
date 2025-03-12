import 'package:bright/core/api/end_point.dart';
import 'package:bright/core/functions/handel_redirect.dart';
import 'package:bright/core/routes/create_cubit.dart';
import 'package:bright/core/routes/route_key.dart';
import 'package:bright/features/auth/cubit/auth_cubit.dart';
import 'package:bright/features/auth/presentation/views/forgot_password_view.dart';
import 'package:bright/features/auth/presentation/views/login_view.dart';
import 'package:bright/features/auth/presentation/views/reset_password_view.dart';
import 'package:bright/features/auth/presentation/views/register_view.dart';
import 'package:bright/features/boarding/cubit/boarding_cubit.dart';
import 'package:bright/features/boarding/prsentation/views/boarding_view.dart';
import 'package:bright/features/contact/presentation/views/contact_view.dart';
import 'package:bright/features/course/models/course_model.dart';
import 'package:bright/features/course/presentation/views/course_view.dart';
import 'package:bright/features/course/presentation/views/course_details_view.dart';
import 'package:bright/features/course/presentation/views/videos_view.dart';
import 'package:bright/features/home/presentation/views/home_view.dart';
import 'package:bright/features/instructor/models/instructor_model.dart';
import 'package:bright/features/instructor/presentation/views/instructor_details_view.dart';
import 'package:bright/features/instructor/presentation/views/instructor_view.dart';
import 'package:bright/features/profile/presentation/views/my_details_view.dart';
import 'package:bright/features/profile/presentation/views/payment_view.dart';
import 'package:bright/features/profile/presentation/views/profile_edit_view.dart';
import 'package:bright/features/profile/presentation/views/profile_view.dart';
import 'package:bright/features/splash/cubit/splash_cubit.dart';
import 'package:bright/features/splash/presentation/views/splash_view.dart';
import 'package:bright/features/testimonial/cubit/testimonial_cubit.dart';
import 'package:bright/features/testimonial/presentation/views/testimonial_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  //  set start screen
  initialLocation: RouteKey.splashView,

  //  Redirect deep links while retaining the data sent with it
  redirect: (context, state) => handleRedirect(state),

  routes: [
    // splash screen
    GoRoute(
      path: RouteKey.splashView,
      builder: (context, state) {
        return BlocProvider(
          create: (context) =>
              // send query parameters to splashCubit with splashViewTimer
              // to navigate to the next screen after splash
              SplashCubit()..splashViewTimer(state.uri.queryParameters),
          child: const SplashView(),
        );
      },
    ),

    // boarding screen
    GoRoute(
      path: RouteKey.boardingView,
      builder: (context, state) => BlocProvider(
        create: (context) => BoardingCubit(),
        child: const BoardingView(),
      ),
    ),

    // login screen
    GoRoute(
      path: RouteKey.loginView,
      builder: (context, state) {
        //  reseive new uri from splash
        final Uri? uri = state.extra as Uri?;
        final String? deepEmail = uri?.queryParameters[ApiKey.email];
        final String? deepToken = uri?.queryParameters[ApiKey.token];
        final AuthCubit authCubit = createAuthCubit();

        if (deepEmail != null && deepToken != null) {
          authCubit.confirmEmail(email: deepEmail, token: deepToken);
        }
        return BlocProvider(
          create: (context) => authCubit,
          child: const LoginView(),
        );
      },
    ),

    // register screen
    GoRoute(
      path: RouteKey.registerView,
      builder: (context, state) => BlocProvider(
        create: (context) => createAuthCubit(),
        child: const RegisterView(),
      ),
    ),

    // forgot password screen
    GoRoute(
      path: RouteKey.forgotPasswordView,
      builder: (context, state) => BlocProvider(
        create: (context) => createAuthCubit(),
        child: const ForgotPasswordView(),
      ),
    ),

    // reset password screen
    GoRoute(
      path: RouteKey.resetPasswordView,
      builder: (context, state) {
        // receive new uri form splash
        final Uri? uri = state.extra as Uri?;
        final String? deepEmail = uri?.queryParameters[ApiKey.email];
        final String? deepToken = uri?.queryParameters[ApiKey.token];
        final AuthCubit authCubit = createAuthCubit();

        //  send deepEmail and deepToken to Auth cubit
        if (deepEmail != null && deepToken != null) {
          authCubit.getEmailAndToken(email: deepEmail, token: deepToken);
        }

        return BlocProvider(
          create: (context) => authCubit,
          child: const ResetPasswordView(),
        );
      },
    ),

    // home screen
    GoRoute(
      path: RouteKey.homeView,
      builder: (context, state) => const HomeView(),
    ),

    // instructor screen
    GoRoute(
      path: RouteKey.instructorView,
      builder: (context, state) => BlocProvider(
        create: (context) => createInstructorCubit()..getInstructors(),
        child: const InstructorView(),
      ),
    ),

    // instructor details screen
    GoRoute(
      path: RouteKey.instructorDetailsView,
      builder: (context, state) => InstructorDetailsView(
        instructorItem: state.extra as InstructorItem,
      ),
    ),

    // courses screen
    GoRoute(
      path: RouteKey.courseView,
      builder: (context, state) => BlocProvider(
        create: (context) => createCourseCubit()..getCourses(),
        child: const CourseView(),
      ),
    ),

    // course details screen
    GoRoute(
      path: RouteKey.courseDetailsView,
      builder: (context, state) {
        final CourseItem courseItem = state.extra as CourseItem;
        return BlocProvider(
          create: (context) => createCourseCubit()..getSections(courseItem.id),
          child: CourseDetailsView(
            courseItem: courseItem,
          ),
        );
      },
    ),

    // videos screen
    GoRoute(
      path: RouteKey.videosView,
      builder: (context, state) {
        final Map<String, dynamic> extra = state.extra as Map<String, dynamic>;
        final int sectionId = extra['sectionId'];
        final String sectionName = extra['sectionName'];

        return BlocProvider(
          create: (context) => createCourseCubit()..getVideos(sectionId),
          child: VideosView(
            sectionName: sectionName,
            sectionId: sectionId,
          ),
        );
      },
    ),

    // testimonial screen
    GoRoute(
      path: RouteKey.testimonialView,
      builder: (context, state) => BlocProvider(
        create: (context) => TestimonialCubit()..startAutoScroll(),
        child: const TestimonialView(),
      ),
    ),

    // contact screen
    GoRoute(
      path: RouteKey.contactView,
      builder: (context, state) => const ContactView(),
    ),

    // profile screen
    GoRoute(
      path: RouteKey.profileView,
      builder: (context, state) => const ProfileView(),
    ),

    // my details screen
    GoRoute(
      path: RouteKey.myDetailsView,
      builder: (context, state) => BlocProvider(
        create: (context) => createProfileCubit()..getUser(),
        child: const MyDetailsView(),
      ),
    ),

    // payment screen
    GoRoute(
      path: RouteKey.paymentView,
      builder: (context, state) => const PaymentView(),
    ),

    // edit profile screen
    GoRoute(
      path: RouteKey.profileEditView,
      builder: (context, state) => BlocProvider(
        create: (context) => createProfileCubit(),
        child: const ProfileEditView(),
      ),
    ),
  ],
);
