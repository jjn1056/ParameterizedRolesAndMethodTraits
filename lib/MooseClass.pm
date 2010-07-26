package MooseClass;
use Moose;

sub my_method {
    my ($self, $name, $age) = @_;
    return "Hi $name, you are $age years old";
}

__PACKAGE__->meta->make_immutable;

