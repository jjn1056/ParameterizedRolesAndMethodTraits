use strict; 
use warnings; 
use Test::More; 
 
use_ok 'MyDecoratedClass';

ok my $class = MyDecoratedClass->new,
  'Created class';

is $class->title('Hello'), "'FAQ: Hello' is the title",
  'Works as expected';
 
done_testing; 
