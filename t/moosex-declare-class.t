use strict; 
use warnings; 
use Test::More; 
 
use_ok 'MooseXDeclareClass';

ok my $class = MooseXDeclareClass->new,
  'Created class';

is $class->my_method('John',41), 'Hi John, you are 41 years old',
  'Works as expected';
 
done_testing; 
