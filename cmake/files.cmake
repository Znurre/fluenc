set(LIB_HEADER_FILES
    "${PROJECT_HEADER_DIR}/AllIterator.h"
	"${PROJECT_HEADER_DIR}/BuildConfiguration.h"
    "${PROJECT_HEADER_DIR}/CompilerException.h"
    "${PROJECT_HEADER_DIR}/DefaultPrototypeProvider.h"
	"${PROJECT_HEADER_DIR}/DummyIteratorStorage.h"
    "${PROJECT_HEADER_DIR}/DzArgument.h"
    "${PROJECT_HEADER_DIR}/DzBaseArgument.h"
	"${PROJECT_HEADER_DIR}/DzResult.h"
    "${PROJECT_HEADER_DIR}/DzTupleArgument.h"
    "${PROJECT_HEADER_DIR}/DzTypeName.h"
	"${PROJECT_HEADER_DIR}/Emitter.h"
    "${PROJECT_HEADER_DIR}/EntryPoint.h"
    "${PROJECT_HEADER_DIR}/FunctionAttribute.h"
	"${PROJECT_HEADER_DIR}/FunctionHelper.h"
    "${PROJECT_HEADER_DIR}/FunctionNotFoundException.h"
    "${PROJECT_HEADER_DIR}/FunctionTypeName.h"
    "${PROJECT_HEADER_DIR}/Indexed.h"
    "${PROJECT_HEADER_DIR}/IndexIterator.h"
    "${PROJECT_HEADER_DIR}/InteropHelper.h"
    "${PROJECT_HEADER_DIR}/IPrototypeProvider.h"
    "${PROJECT_HEADER_DIR}/IRBuilderEx.h"
    "${PROJECT_HEADER_DIR}/iterators"
    "${PROJECT_HEADER_DIR}/IteratorStorage.h"
	"${PROJECT_HEADER_DIR}/IIteratorStorage.h"
    "${PROJECT_HEADER_DIR}/ITypeName.h"
	"${PROJECT_HEADER_DIR}/ModuleInfo.h"
    "${PROJECT_HEADER_DIR}/Namespace.h"
    "${PROJECT_HEADER_DIR}/Node.h"
	"${PROJECT_HEADER_DIR}/NodeVisitor.h"
    "${PROJECT_HEADER_DIR}/Stack.h"
    "${PROJECT_HEADER_DIR}/TokenInfo.h"
    "${PROJECT_HEADER_DIR}/Type.h"
    "${PROJECT_HEADER_DIR}/UndeclaredIdentifierException.h"
	"${PROJECT_HEADER_DIR}/Use.h"
    "${PROJECT_HEADER_DIR}/Utility.h"
    "${PROJECT_HEADER_DIR}/ValueHelper.h"
	"${PROJECT_HEADER_DIR}/Visitable.h"
    "${PROJECT_HEADER_DIR}/Visitor.h"
    "${PROJECT_HEADER_DIR}/VoidIterator.h"
    "${PROJECT_HEADER_DIR}/WithPrototypeProvider.h"
    "${PROJECT_HEADER_DIR}/ZipIterator.h"
    "${PROJECT_HEADER_DIR}/iterators/ExtremitiesIterator.h"
	"${PROJECT_HEADER_DIR}/metadata/ExpandedValueMetadata.h"
	"${PROJECT_HEADER_DIR}/metadata/ExpandableValueMetadata.h"
    "${PROJECT_HEADER_DIR}/metadata/FunctionValueMetadata.h"
    "${PROJECT_HEADER_DIR}/metadata/IndexedValueMetadata.h"
	"${PROJECT_HEADER_DIR}/metadata/LazyValueMetadata.h"
	"${PROJECT_HEADER_DIR}/metadata/NamedValueMetadata.h"
	"${PROJECT_HEADER_DIR}/metadata/PlaceholderValueMetadata.h"
	"${PROJECT_HEADER_DIR}/metadata/ReferenceValueMetadata.h"
	"${PROJECT_HEADER_DIR}/metadata/ScalarValueMetadata.h"
	"${PROJECT_HEADER_DIR}/metadata/StringValueMetadata.h"
	"${PROJECT_HEADER_DIR}/metadata/TupleValueMetadata.h"
	"${PROJECT_HEADER_DIR}/metadata/UserTypeValueMetadata.h"
	"${PROJECT_HEADER_DIR}/metadata/ValueMetadata.h"
	"${PROJECT_HEADER_DIR}/metadata/WithoutValueMetadata.h"
    "${PROJECT_HEADER_DIR}/nodes/ArrayContinuationNode.h"
    "${PROJECT_HEADER_DIR}/nodes/ArrayElementNode.h"
    "${PROJECT_HEADER_DIR}/nodes/ArraySinkNode.h"
    "${PROJECT_HEADER_DIR}/nodes/BinaryNode.h"
    "${PROJECT_HEADER_DIR}/nodes/BlockInstructionNode.h"
    "${PROJECT_HEADER_DIR}/nodes/BlockStackFrameNode.h"
    "${PROJECT_HEADER_DIR}/nodes/BooleanLiteralNode.h"
    "${PROJECT_HEADER_DIR}/nodes/CallableNode.h"
    "${PROJECT_HEADER_DIR}/nodes/CharacterLiteralNode.h"
    "${PROJECT_HEADER_DIR}/nodes/ConditionalNode.h"
    "${PROJECT_HEADER_DIR}/nodes/ContinuationNode.h"
	"${PROJECT_HEADER_DIR}/nodes/DistributorNode.h"
    "${PROJECT_HEADER_DIR}/nodes/EmptyArrayNode.h"
    "${PROJECT_HEADER_DIR}/nodes/ExpansionNode.h"
    "${PROJECT_HEADER_DIR}/nodes/ExportedFunctionNode.h"
    "${PROJECT_HEADER_DIR}/nodes/ExportedFunctionTerminatorNode.h"
    "${PROJECT_HEADER_DIR}/nodes/FloatLiteralNode.h"
    "${PROJECT_HEADER_DIR}/nodes/FunctionCallNode.h"
	"${PROJECT_HEADER_DIR}/nodes/FunctionCallProxyNode.h"
    "${PROJECT_HEADER_DIR}/nodes/TailFunctionCallNode.h"
    "${PROJECT_HEADER_DIR}/nodes/FunctionNode.h"
    "${PROJECT_HEADER_DIR}/nodes/GlobalNode.h"
    "${PROJECT_HEADER_DIR}/nodes/IBlockInstruction.h"
    "${PROJECT_HEADER_DIR}/nodes/ImportedFunctionNode.h"
    "${PROJECT_HEADER_DIR}/nodes/IndexSinkNode.h"
    "${PROJECT_HEADER_DIR}/nodes/InstantiationNode.h"
    "${PROJECT_HEADER_DIR}/nodes/IteratableNode.h"
    "${PROJECT_HEADER_DIR}/nodes/IntegralLiteralNode.h"
    "${PROJECT_HEADER_DIR}/nodes/JunctionNode.h"
    "${PROJECT_HEADER_DIR}/nodes/LazyEvaluationNode.h"
    "${PROJECT_HEADER_DIR}/nodes/LazySinkNode.h"
    "${PROJECT_HEADER_DIR}/nodes/LocalNode.h"
    "${PROJECT_HEADER_DIR}/nodes/MemberAccessNode.h"
	"${PROJECT_HEADER_DIR}/nodes/NothingNode.h"
	"${PROJECT_HEADER_DIR}/nodes/ParentInjectorNode.h"
    "${PROJECT_HEADER_DIR}/nodes/ReferenceSinkNode.h"
    "${PROJECT_HEADER_DIR}/nodes/ReturnNode.h"
    "${PROJECT_HEADER_DIR}/nodes/StackSegmentNode.h"
    "${PROJECT_HEADER_DIR}/nodes/StringLiteralNode.h"
    "${PROJECT_HEADER_DIR}/nodes/TerminatorNode.h"
	"${PROJECT_HEADER_DIR}/nodes/UnaryNode.h"
	"${PROJECT_HEADER_DIR}/types/AggregateType.h"
    "${PROJECT_HEADER_DIR}/types/AnyType.h"
    "${PROJECT_HEADER_DIR}/types/ArrayType.h"
    "${PROJECT_HEADER_DIR}/types/BooleanOperatorSet.h"
    "${PROJECT_HEADER_DIR}/types/BooleanType.h"
    "${PROJECT_HEADER_DIR}/types/BuiltinType.h"
    "${PROJECT_HEADER_DIR}/types/ByteType.h"
	"${PROJECT_HEADER_DIR}/types/ExpandedType.h"
	"${PROJECT_HEADER_DIR}/types/Float32Type.h"
	"${PROJECT_HEADER_DIR}/types/FloatOperatorSet.h"
    "${PROJECT_HEADER_DIR}/types/FunctionType.h"
	"${PROJECT_HEADER_DIR}/types/IntegerType.h"
	"${PROJECT_HEADER_DIR}/types/IntegerOperatorSet.h"
    "${PROJECT_HEADER_DIR}/types/Int32Type.h"
    "${PROJECT_HEADER_DIR}/types/Int64Type.h"
    "${PROJECT_HEADER_DIR}/types/IOperatorSet.h"
	"${PROJECT_HEADER_DIR}/types/IPrototype.h"
    "${PROJECT_HEADER_DIR}/types/IteratorType.h"
    "${PROJECT_HEADER_DIR}/types/PlaceholderType.h"
    "${PROJECT_HEADER_DIR}/types/PrototypeFieldEmbryo.h"
    "${PROJECT_HEADER_DIR}/types/PrototypeField.h"
    "${PROJECT_HEADER_DIR}/types/Prototype.h"
    "${PROJECT_HEADER_DIR}/types/ProxyType.h"
    "${PROJECT_HEADER_DIR}/types/StringOperatorSet.h"
    "${PROJECT_HEADER_DIR}/types/StringType.h"
    "${PROJECT_HEADER_DIR}/types/TupleType.h"
    "${PROJECT_HEADER_DIR}/types/Uint32Type.h"
    "${PROJECT_HEADER_DIR}/types/UserTypeField.h"
    "${PROJECT_HEADER_DIR}/types/UserType.h"
    "${PROJECT_HEADER_DIR}/types/VoidType.h"
    "${PROJECT_HEADER_DIR}/types/WithoutType.h"
    "${PROJECT_HEADER_DIR}/types/WithPrototype.h"
    "${PROJECT_HEADER_DIR}/values/ArrayValueGenerator.h"
    "${PROJECT_HEADER_DIR}/values/ArrayValue.h"
    "${PROJECT_HEADER_DIR}/values/BaseValue.h"
    "${PROJECT_HEADER_DIR}/values/ExpandableValue.h"
    "${PROJECT_HEADER_DIR}/values/ExpandedValue.h"
	"${PROJECT_HEADER_DIR}/values/ForwardedValue.h"
    "${PROJECT_HEADER_DIR}/values/FunctionValue.h"
    "${PROJECT_HEADER_DIR}/values/IIteratable.h"
    "${PROJECT_HEADER_DIR}/values/ILazyValueGenerator.h"
    "${PROJECT_HEADER_DIR}/values/IndexedValue.h"
    "${PROJECT_HEADER_DIR}/values/IteratorValueGenerator.h"
    "${PROJECT_HEADER_DIR}/values/IteratorValue.h"
    "${PROJECT_HEADER_DIR}/values/LazyValue.h"
    "${PROJECT_HEADER_DIR}/values/NamedValue.h"
    "${PROJECT_HEADER_DIR}/values/PlaceholderValue.h"
    "${PROJECT_HEADER_DIR}/values/ReferenceValue.h"
    "${PROJECT_HEADER_DIR}/values/ScalarValue.h"
	"${PROJECT_HEADER_DIR}/values/StringIteratable.h"
	"${PROJECT_HEADER_DIR}/values/StringIteratableGenerator.h"
    "${PROJECT_HEADER_DIR}/values/StringValue.h"
    "${PROJECT_HEADER_DIR}/values/TupleValue.h"
    "${PROJECT_HEADER_DIR}/values/UserTypeValue.h"
    "${PROJECT_HEADER_DIR}/values/WithoutValue.h"
    "${PROJECT_HEADER_DIR}/exceptions/AmbiguousFunctionException.h"
    "${PROJECT_HEADER_DIR}/exceptions/FileNotFoundException.h"
    "${PROJECT_HEADER_DIR}/exceptions/InvalidArgumentTypeException.h"
    "${PROJECT_HEADER_DIR}/exceptions/InvalidFunctionPointerTypeException.h"
    "${PROJECT_HEADER_DIR}/exceptions/InvalidOperatorException.h"
	"${PROJECT_HEADER_DIR}/exceptions/InvalidTypeException.h"
	"${PROJECT_HEADER_DIR}/exceptions/MissingDefaultValueException.h"
	"${PROJECT_HEADER_DIR}/exceptions/MissingFieldException.h"
	"${PROJECT_HEADER_DIR}/exceptions/MissingTailCallException.h"
    "${PROJECT_HEADER_DIR}/exceptions/MissingTypeDeclarationException.h"
    "${PROJECT_HEADER_DIR}/exceptions/ParserException.h"
    "${PROJECT_HEADER_DIR}/exceptions/TypeMismatchException.h"
    "${PROJECT_HEADER_DIR}/exceptions/UnknownTypeException.h"
    )

set(LIB_SOURCE_FILES
    "${PROJECT_SRC_DIR}/AllIterator.cpp"
    "${PROJECT_SRC_DIR}/CompilerException.cpp"
    "${PROJECT_SRC_DIR}/DefaultPrototypeProvider.cpp"
	"${PROJECT_SRC_DIR}/DummyIteratorStorage.cpp"
    "${PROJECT_SRC_DIR}/DzArgument.cpp"
    "${PROJECT_SRC_DIR}/DzTupleArgument.cpp"
    "${PROJECT_SRC_DIR}/DzTypeName.cpp"
	"${PROJECT_SRC_DIR}/Emitter.cpp"
    "${PROJECT_SRC_DIR}/EntryPoint.cpp"
    "${PROJECT_SRC_DIR}/FunctionHelper.cpp"
    "${PROJECT_SRC_DIR}/FunctionNotFoundException.cpp"
    "${PROJECT_SRC_DIR}/FunctionTypeName.cpp"
    "${PROJECT_SRC_DIR}/IndexIterator.cpp"
    "${PROJECT_SRC_DIR}/InteropHelper.cpp"
    "${PROJECT_SRC_DIR}/ITransferStrategy.h"
    "${PROJECT_SRC_DIR}/IRBuilderEx.cpp"
    "${PROJECT_SRC_DIR}/IteratorStorage.cpp"
    "${PROJECT_SRC_DIR}/Namespace.cpp"
    "${PROJECT_SRC_DIR}/Node.cpp"
    "${PROJECT_SRC_DIR}/Stack.cpp"
    "${PROJECT_SRC_DIR}/Type.cpp"
    "${PROJECT_SRC_DIR}/UndeclaredIdentifierException.cpp"
	"${PROJECT_SRC_DIR}/Use.cpp"
    "${PROJECT_SRC_DIR}/Utility.cpp"
    "${PROJECT_SRC_DIR}/ValueHelper.cpp"
    "${PROJECT_SRC_DIR}/Visitor.cpp"
    "${PROJECT_SRC_DIR}/WithPrototypeProvider.cpp"
	"${PROJECT_SRC_DIR}/metadata/ExpandedValueMetadata.cpp"
	"${PROJECT_SRC_DIR}/metadata/ExpandableValueMetadata.cpp"
	"${PROJECT_SRC_DIR}/metadata/FunctionValueMetadata.cpp"
	"${PROJECT_SRC_DIR}/metadata/IndexedValueMetadata.cpp"
	"${PROJECT_SRC_DIR}/metadata/NamedValueMetadata.cpp"
	"${PROJECT_SRC_DIR}/metadata/LazyValueMetadata.cpp"
	"${PROJECT_SRC_DIR}/metadata/PlaceholderValueMetadata.cpp"
	"${PROJECT_SRC_DIR}/metadata/ReferenceValueMetadata.cpp"
	"${PROJECT_SRC_DIR}/metadata/ScalarValueMetadata.cpp"
	"${PROJECT_SRC_DIR}/metadata/StringValueMetadata.cpp"
	"${PROJECT_SRC_DIR}/metadata/TupleValueMetadata.cpp"
	"${PROJECT_SRC_DIR}/metadata/UserTypeValueMetadata.cpp"
	"${PROJECT_SRC_DIR}/metadata/WithoutValueMetadata.cpp"
    "${PROJECT_SRC_DIR}/nodes/ArrayContinuationNode.cpp"
    "${PROJECT_SRC_DIR}/nodes/ArrayElementNode.cpp"
    "${PROJECT_SRC_DIR}/nodes/ArraySinkNode.cpp"
    "${PROJECT_SRC_DIR}/nodes/BlockInstructionNode.cpp"
    "${PROJECT_SRC_DIR}/nodes/BlockStackFrameNode.cpp"
    "${PROJECT_SRC_DIR}/nodes/BooleanLiteralNode.cpp"
    "${PROJECT_SRC_DIR}/nodes/CharacterLiteralNode.cpp"
    "${PROJECT_SRC_DIR}/nodes/ConditionalNode.cpp"
    "${PROJECT_SRC_DIR}/nodes/ContinuationNode.cpp"
    "${PROJECT_SRC_DIR}/nodes/EmptyArrayNode.cpp"
    "${PROJECT_SRC_DIR}/nodes/ExpansionNode.cpp"
    "${PROJECT_SRC_DIR}/nodes/ExportedFunctionNode.cpp"
    "${PROJECT_SRC_DIR}/nodes/ExportedFunctionTerminatorNode.cpp"
	"${PROJECT_SRC_DIR}/nodes/FloatLiteralNode.cpp"
    "${PROJECT_SRC_DIR}/nodes/FunctionCallNode.cpp"
	"${PROJECT_SRC_DIR}/nodes/FunctionCallProxyNode.cpp"
    "${PROJECT_SRC_DIR}/nodes/TailFunctionCallNode.cpp"
    "${PROJECT_SRC_DIR}/nodes/FunctionNode.cpp"
    "${PROJECT_SRC_DIR}/nodes/GlobalNode.cpp"
    "${PROJECT_SRC_DIR}/nodes/ImportedFunctionNode.cpp"
    "${PROJECT_SRC_DIR}/nodes/IndexSinkNode.cpp"
    "${PROJECT_SRC_DIR}/nodes/InstantiationNode.cpp"
	"${PROJECT_SRC_DIR}/nodes/IteratableNode.cpp"
    "${PROJECT_SRC_DIR}/nodes/IntegralLiteralNode.cpp"
    "${PROJECT_SRC_DIR}/nodes/JunctionNode.cpp"
    "${PROJECT_SRC_DIR}/nodes/LazyEvaluationNode.cpp"
    "${PROJECT_SRC_DIR}/nodes/LazySinkNode.cpp"
    "${PROJECT_SRC_DIR}/nodes/LocalNode.cpp"
    "${PROJECT_SRC_DIR}/nodes/MemberAccessNode.cpp"
	"${PROJECT_SRC_DIR}/nodes/NothingNode.cpp"
	"${PROJECT_SRC_DIR}/nodes/ParentInjectorNode.cpp"
    "${PROJECT_SRC_DIR}/nodes/ReferenceSinkNode.cpp"
    "${PROJECT_SRC_DIR}/nodes/ReturnNode.cpp"
    "${PROJECT_SRC_DIR}/nodes/StackSegmentNode.cpp"
    "${PROJECT_SRC_DIR}/nodes/StringLiteralNode.cpp"
    "${PROJECT_SRC_DIR}/nodes/TerminatorNode.cpp"
    "${PROJECT_SRC_DIR}/nodes/UnaryNode.cpp"
    "${PROJECT_SRC_DIR}/types/AggregateType.cpp"
    "${PROJECT_SRC_DIR}/types/AnyType.cpp"
    "${PROJECT_SRC_DIR}/types/ArrayType.cpp"
	"${PROJECT_SRC_DIR}/types/BooleanOperatorSet.cpp"
    "${PROJECT_SRC_DIR}/types/BooleanType.cpp"
    "${PROJECT_SRC_DIR}/types/ByteType.cpp"
	"${PROJECT_SRC_DIR}/types/ExpandedType.cpp"
    "${PROJECT_SRC_DIR}/types/Float32Type.cpp"
    "${PROJECT_SRC_DIR}/types/FloatOperatorSet.cpp"
    "${PROJECT_SRC_DIR}/types/FunctionType.cpp"
    "${PROJECT_SRC_DIR}/types/IntegerType.cpp"
	"${PROJECT_SRC_DIR}/types/IntegerOperatorSet.cpp"
    "${PROJECT_SRC_DIR}/types/Int32Type.cpp"
    "${PROJECT_SRC_DIR}/types/Int64Type.cpp"
    "${PROJECT_SRC_DIR}/types/IteratorType.cpp"
    "${PROJECT_SRC_DIR}/types/PlaceholderType.cpp"
    "${PROJECT_SRC_DIR}/types/Prototype.cpp"
    "${PROJECT_SRC_DIR}/types/PrototypeField.cpp"
    "${PROJECT_SRC_DIR}/types/PrototypeFieldEmbryo.cpp"
    "${PROJECT_SRC_DIR}/types/ProxyType.cpp"
	"${PROJECT_SRC_DIR}/types/StringOperatorSet.cpp"
    "${PROJECT_SRC_DIR}/types/StringType.cpp"
    "${PROJECT_SRC_DIR}/types/TupleType.cpp"
    "${PROJECT_SRC_DIR}/types/Uint32Type.cpp"
    "${PROJECT_SRC_DIR}/types/UserType.cpp"
    "${PROJECT_SRC_DIR}/types/UserTypeField.cpp"
    "${PROJECT_SRC_DIR}/types/VoidType.cpp"
    "${PROJECT_SRC_DIR}/types/WithoutType.cpp"
    "${PROJECT_SRC_DIR}/types/WithPrototype.cpp"
    "${PROJECT_SRC_DIR}/values/ArrayValue.cpp"
    "${PROJECT_SRC_DIR}/values/ArrayValueGenerator.cpp"
    "${PROJECT_SRC_DIR}/values/ExpandableValue.cpp"
    "${PROJECT_SRC_DIR}/values/ExpandedValue.cpp"
    "${PROJECT_SRC_DIR}/values/FunctionValue.cpp"
    "${PROJECT_SRC_DIR}/values/ForwardedValue.cpp"
    "${PROJECT_SRC_DIR}/values/IndexedValue.cpp"
    "${PROJECT_SRC_DIR}/values/IteratorValue.cpp"
    "${PROJECT_SRC_DIR}/values/IteratorValueGenerator.cpp"
    "${PROJECT_SRC_DIR}/values/LazyValue.cpp"
    "${PROJECT_SRC_DIR}/values/NamedValue.cpp"
    "${PROJECT_SRC_DIR}/values/PlaceholderValue.cpp"
    "${PROJECT_SRC_DIR}/values/ReferenceValue.cpp"
    "${PROJECT_SRC_DIR}/values/ScalarValue.cpp"
    "${PROJECT_SRC_DIR}/values/StringIteratable.cpp"
	"${PROJECT_SRC_DIR}/values/StringIteratableGenerator.cpp"
	"${PROJECT_SRC_DIR}/values/StringValue.cpp"
    "${PROJECT_SRC_DIR}/values/TupleValue.cpp"
    "${PROJECT_SRC_DIR}/values/UserTypeValue.cpp"
    "${PROJECT_SRC_DIR}/values/WithoutValue.cpp"
    "${PROJECT_SRC_DIR}/exceptions/AmbiguousFunctionException.cpp"
    "${PROJECT_SRC_DIR}/exceptions/FileNotFoundException.cpp"
    "${PROJECT_SRC_DIR}/exceptions/InvalidArgumentTypeException.cpp"
    "${PROJECT_SRC_DIR}/exceptions/InvalidFunctionPointerTypeException.cpp"
    "${PROJECT_SRC_DIR}/exceptions/InvalidOperatorException.cpp"
	"${PROJECT_SRC_DIR}/exceptions/InvalidTypeException.cpp"
	"${PROJECT_SRC_DIR}/exceptions/MissingDefaultValueException.cpp"
	"${PROJECT_SRC_DIR}/exceptions/MissingFieldException.cpp"
	"${PROJECT_SRC_DIR}/exceptions/MissingTailCallException.cpp"
    "${PROJECT_SRC_DIR}/exceptions/MissingTypeDeclarationException.cpp"
    "${PROJECT_SRC_DIR}/exceptions/ParserException.cpp"
    "${PROJECT_SRC_DIR}/exceptions/TypeMismatchException.cpp"
    "${PROJECT_SRC_DIR}/exceptions/UnknownTypeException.cpp"
    )

set(LIB_HEADER_FILES
    ${LIB_HEADER_FILES}
)

set(LIB_SOURCE_FILES
    ${LIB_SOURCE_FILES}
)

set(COMPILER_HEADER_FILES
	"${PROJECT_SRC_DIR}/ProjectFileParser.h"
    )

set(COMPILER_SOURCE_FILES
    "${PROJECT_SRC_DIR}/main.cpp"
    "${PROJECT_SRC_DIR}/ProjectFileParser.cpp"
    )

set(TEST_HEADER_FILES
	"${PROJECT_TEST_DIR}/TestHelpers.h"
    "${PROJECT_TEST_DIR}/KaleidoscopeJIT.h"
    )

set(TEST_SOURCE_FILES
    "${PROJECT_TEST_DIR}/main.cpp"
    )
