prefix operator !
prefix operator -
prefix operator √
prefix operator ∛
prefix operator ∜
prefix operator ∑

infix operator ⨀	: MultiplicationPrecedence
infix operator ⨀!	: MultiplicationPrecedence
infix operator .*	: MultiplicationPrecedence
infix operator ⨂	: MultiplicationPrecedence
infix operator *	: MultiplicationPrecedence
infix operator ./	: MultiplicationPrecedence
infix operator ∖	: MultiplicationPrecedence
infix operator ∠	: MultiplicationPrecedence
infix operator ×	: MultiplicationPrecedence
infix operator •	: MultiplicationPrecedence
infix operator √	: MultiplicationPrecedence
infix operator ↑    : MultiplicationPrecedence

infix operator ⨁	: AdditionPrecedence
infix operator ⨁!	: AdditionPrecedence
infix operator .+	: AdditionPrecedence
infix operator .+!	: AdditionPrecedence
infix operator .-	: AdditionPrecedence
infix operator .-!	: AdditionPrecedence
infix operator +	: AdditionPrecedence
infix operator +!	: AdditionPrecedence
infix operator -	: AdditionPrecedence
infix operator -!	: AdditionPrecedence
infix operator ∔	: AdditionPrecedence
infix operator ∓	: AdditionPrecedence
infix operator ±	: AdditionPrecedence

infix operator →	: CastingPrecedence

infix operator ≐	: ComparisonPrecedence	// values equal within the limits of their given significant figures
infix operator ~	: ComparisonPrecedence  //     of the same fundamental order of units
infix operator !~	: ComparisonPrecedence	// not of the same fundamental order of units
infix operator ⨃		: ComparisonPrecedence	// have any fundamental base units in common
infix operator ⩀		: ComparisonPrecedence	// have base units in common on same side of units ratio
infix operator ⧦	: ComparisonPrecedence	// uses a non-zero-offset system of units
infix operator ⧗	: ComparisonPrecedence	// matching non-zero-offset units
infix operator ⧖	: ComparisonPrecedence	// exactly matching units
infix operator <	: ComparisonPrecedence

infix operator &&	: LogicalConjunctionPrecedence
infix operator ¬	: LogicalConjunctionPrecedence
infix operator ∩ 	: LogicalConjunctionPrecedence
infix operator ^^ 	: LogicalConjunctionPrecedence
infix operator ⊻	: LogicalConjunctionPrecedence

postfix operator %
postfix operator /
postfix operator ¬ // 2d matrix transpose operator
postfix operator °
