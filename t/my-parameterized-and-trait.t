use strict; 
use warnings; 
use Test::More; 
 
use_ok 'MyParameterizedAndTrait';

ok my $class = MyParameterizedAndTrait->new,
  'Created class';

is $class->title('Hello'), "<p>'FAQ: Hello' is the title</p>",
  'Works as expected';
 
done_testing; 
