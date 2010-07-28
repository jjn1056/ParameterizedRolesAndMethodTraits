use strict; 
use warnings; 
use Test::More; 
use Test::Output;

use_ok 'LoggedMethodsParameterizableRole';

ok my $class = LoggedMethodsParameterizableRole->new,
  'Created class';

stderr_like( sub {
    is $class->my_method('John',41), 'Hi John, you are 41 years old',
      'Works as expected';
}, qr/my_method was called with/, 'Got expected warnings');
 
done_testing; 
