use MooseX::Declare;
role MyMethodTrait {
    use Scalar::Util;
    has tag => (is=>'ro', isa=>'Str', required=>1, default=>'div');
    around wrap(ClassName $class: $code, %options) {
        my $method_obj;
        my $weakened_method_obj = \$method_obj;
        my $replacement = sub {
            my ($self, $string) = @_;
            my $title = $self->$code($string);
            my $tag = ${$weakened_method_obj}->tag;
            Scalar::Util::weaken $weakened_method_obj;
            return "<$tag>$title</$tag>";
        };
        $method_obj = $class->$orig($replacement, %options);
        return $method_obj;
    }
}

__END__


