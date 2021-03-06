# encoding: UTF-8

module CSKit
  module Parsers
    module Bible

      class CitationNode < Treetop::Runtime::SyntaxNode
        def to_sexp
          [[:book, book.to_sexp], [:chapters, chapter_list.to_sexp]]
        end

        def to_object
          CSKit::Parsers::Bible::Citation.new(
            book.text_value,
            chapter_list.to_object
          )
        end
      end

      class BookNode < Treetop::Runtime::SyntaxNode
        def to_sexp
          text_value
        end
      end

      class ChapterListNode < Treetop::Runtime::SyntaxNode
        def to_sexp
          result = [chapter.to_sexp]

          if elements[1] && elements[1].respond_to?(:chapter_list)
            result += elements[1].chapter_list.to_sexp
          end

          result
        end

        def to_object
          result = [chapter.to_object]

          if elements[1] && elements[1].respond_to?(:chapter_list)
            result += elements[1].chapter_list.to_object
          end

          result
        end
      end

      class ChapterNode < Treetop::Runtime::SyntaxNode
        def text_value
          super.to_i
        end

        def to_sexp
          [text_value, verse_list.to_sexp]
        end

        def to_object
          CSKit::Parsers::Bible::Chapter.new(
            text_value,
            verse_list.to_object
          )
        end
      end

      class VerseListNode < Treetop::Runtime::SyntaxNode
        def to_sexp
          result = [verse.to_sexp]

          if elements[1] && elements[1].respond_to?(:verse_list)
            result += elements[1].verse_list.to_sexp
          end

          result
        end

        def to_object
          result = [verse.to_object]

          if elements[1] && elements[1].respond_to?(:verse_list)
            result += elements[1].verse_list.to_object
          end

          result
        end
      end

      class VerseNode < Treetop::Runtime::SyntaxNode
        def to_sexp
          elements.flat_map { |e| e.to_sexp if e.respond_to?(:to_sexp) }
        end

        def to_object
          line_numbers = elements[0].to_sexp.first

          CSKit::Parsers::Bible::Verse.new(
            line_numbers.first,
            line_numbers.last,
            (starter.to_object rescue nil),
            (terminator.to_object rescue nil)
          )
        end
      end

      class CompoundVerseNumberNode < Treetop::Runtime::SyntaxNode
        def to_sexp
          [[verse_number1.text_value.to_i, verse_number2.text_value.to_i]]
        end
      end

      class VerseNumberNode < Treetop::Runtime::SyntaxNode
        def to_sexp
          [[text_value.to_i, text_value.to_i]]
        end
      end

      class PositionalNode < Treetop::Runtime::SyntaxNode
        def to_sexp
          [get_cardinality, fragment.value]
        end

        def get_cardinality
          card_val = cardinality.text_value.to_i
          card_val == 0 ? 1 : card_val
        end

        def to_object
          Positional.new(get_cardinality, fragment.value)
        end
      end

      class StarterNode < PositionalNode
        def fragment
          starter_fragment
        end
      end

      class TerminatorNode < PositionalNode
        def fragment
          terminator_fragment
        end
      end

      class FragmentNode < Treetop::Runtime::SyntaxNode
        def value
          text_value.strip
        end

        alias :to_sexp :value
      end

    end
  end
end