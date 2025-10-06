import 'bootstrap.dart';
import 'core/config/flavor.dart';

/// Main entry point - defaults to production
void main() => bootstrap(Flavor.prod);
