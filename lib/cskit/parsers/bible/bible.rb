# Autogenerated from a Treetop grammar. Edits may be lost.


# encoding: UTF-8

require 'cskit/parsers/bible/nodes'
# require 'cskit/parsers/bible/objects'

module CSKit
  module Parsers

    module Bible
      include Treetop::Runtime

      def root
        @root ||= :citation
      end

      module Citation0
        def book
          elements[0]
        end

        def chapter
          elements[2]
        end

        def verse_list
          elements[4]
        end
      end

      def _nt_citation
        start_index = index
        if node_cache[:citation].has_key?(index)
          cached = node_cache[:citation][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0, s0 = index, []
        r1 = _nt_book
        s0 << r1
        if r1
          s2, i2 = [], index
          loop do
            if has_terminal?('\G[\\s]', true, index)
              r3 = true
              @index += 1
            else
              r3 = nil
            end
            if r3
              s2 << r3
            else
              break
            end
          end
          r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
          s0 << r2
          if r2
            r4 = _nt_chapter
            s0 << r4
            if r4
              if has_terminal?(":", false, index)
                r5 = instantiate_node(SyntaxNode,input, index...(index + 1))
                @index += 1
              else
                terminal_parse_failure(":")
                r5 = nil
              end
              s0 << r5
              if r5
                r6 = _nt_verse_list
                s0 << r6
              end
            end
          end
        end
        if s0.last
          r0 = instantiate_node(CitationNode,input, i0...index, s0)
          r0.extend(Citation0)
        else
          @index = i0
          r0 = nil
        end

        node_cache[:citation][start_index] = r0

        r0
      end

      def _nt_book
        start_index = index
        if node_cache[:book].has_key?(index)
          cached = node_cache[:book][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        s0, i0 = [], index
        loop do
          if has_terminal?('\G[\\w\\.]', true, index)
            r1 = true
            @index += 1
          else
            r1 = nil
          end
          if r1
            s0 << r1
          else
            break
          end
        end
        if s0.empty?
          @index = i0
          r0 = nil
        else
          r0 = instantiate_node(BookNode,input, i0...index, s0)
        end

        node_cache[:book][start_index] = r0

        r0
      end

      def _nt_chapter
        start_index = index
        if node_cache[:chapter].has_key?(index)
          cached = node_cache[:chapter][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        s0, i0 = [], index
        loop do
          if has_terminal?('\G[\\d]', true, index)
            r1 = true
            @index += 1
          else
            r1 = nil
          end
          if r1
            s0 << r1
          else
            break
          end
        end
        if s0.empty?
          @index = i0
          r0 = nil
        else
          r0 = instantiate_node(ChapterNode,input, i0...index, s0)
        end

        node_cache[:chapter][start_index] = r0

        r0
      end

      module VerseList0
        def verse_list
          elements[3]
        end
      end

      module VerseList1
        def verse
          elements[0]
        end

      end

      def _nt_verse_list
        start_index = index
        if node_cache[:verse_list].has_key?(index)
          cached = node_cache[:verse_list][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0, s0 = index, []
        r1 = _nt_verse
        s0 << r1
        if r1
          i3, s3 = index, []
          s4, i4 = [], index
          loop do
            if has_terminal?('\G[\\s]', true, index)
              r5 = true
              @index += 1
            else
              r5 = nil
            end
            if r5
              s4 << r5
            else
              break
            end
          end
          r4 = instantiate_node(SyntaxNode,input, i4...index, s4)
          s3 << r4
          if r4
            if has_terminal?(",", false, index)
              r6 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure(",")
              r6 = nil
            end
            s3 << r6
            if r6
              s7, i7 = [], index
              loop do
                if has_terminal?('\G[\\s]', true, index)
                  r8 = true
                  @index += 1
                else
                  r8 = nil
                end
                if r8
                  s7 << r8
                else
                  break
                end
              end
              r7 = instantiate_node(SyntaxNode,input, i7...index, s7)
              s3 << r7
              if r7
                r9 = _nt_verse_list
                s3 << r9
              end
            end
          end
          if s3.last
            r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
            r3.extend(VerseList0)
          else
            @index = i3
            r3 = nil
          end
          if r3
            r2 = r3
          else
            r2 = instantiate_node(SyntaxNode,input, index...index)
          end
          s0 << r2
        end
        if s0.last
          r0 = instantiate_node(VerseListNode,input, i0...index, s0)
          r0.extend(VerseList1)
        else
          @index = i0
          r0 = nil
        end

        node_cache[:verse_list][start_index] = r0

        r0
      end

      module Verse0
        def start_fragment
          elements[1]
        end

        def to
          elements[2]
        end
      end

      def _nt_verse
        start_index = index
        if node_cache[:verse].has_key?(index)
          cached = node_cache[:verse][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0, s0 = index, []
        i1 = index
        r2 = _nt_compound_verse_number
        if r2
          r1 = r2
        else
          r3 = _nt_verse_number
          if r3
            r1 = r3
          else
            @index = i1
            r1 = nil
          end
        end
        s0 << r1
        if r1
          r4 = _nt_start_fragment
          s0 << r4
          if r4
            r5 = _nt_to
            s0 << r5
          end
        end
        if s0.last
          r0 = instantiate_node(VerseNode,input, i0...index, s0)
          r0.extend(Verse0)
        else
          @index = i0
          r0 = nil
        end

        node_cache[:verse][start_index] = r0

        r0
      end

      module CompoundVerseNumber0
        def verse_number1
          elements[0]
        end

        def verse_number2
          elements[4]
        end
      end

      def _nt_compound_verse_number
        start_index = index
        if node_cache[:compound_verse_number].has_key?(index)
          cached = node_cache[:compound_verse_number][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0, s0 = index, []
        r1 = _nt_verse_number
        s0 << r1
        if r1
          s2, i2 = [], index
          loop do
            if has_terminal?('\G[\\s]', true, index)
              r3 = true
              @index += 1
            else
              r3 = nil
            end
            if r3
              s2 << r3
            else
              break
            end
          end
          r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
          s0 << r2
          if r2
            if has_terminal?("-", false, index)
              r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure("-")
              r4 = nil
            end
            s0 << r4
            if r4
              s5, i5 = [], index
              loop do
                if has_terminal?('\G[\\s]', true, index)
                  r6 = true
                  @index += 1
                else
                  r6 = nil
                end
                if r6
                  s5 << r6
                else
                  break
                end
              end
              r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
              s0 << r5
              if r5
                r7 = _nt_verse_number
                s0 << r7
              end
            end
          end
        end
        if s0.last
          r0 = instantiate_node(CompoundVerseNumberNode,input, i0...index, s0)
          r0.extend(CompoundVerseNumber0)
        else
          @index = i0
          r0 = nil
        end

        node_cache[:compound_verse_number][start_index] = r0

        r0
      end

      def _nt_verse_number
        start_index = index
        if node_cache[:verse_number].has_key?(index)
          cached = node_cache[:verse_number][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        s0, i0 = [], index
        loop do
          if has_terminal?('\G[\\d]', true, index)
            r1 = true
            @index += 1
          else
            r1 = nil
          end
          if r1
            s0 << r1
          else
            break
          end
        end
        if s0.empty?
          @index = i0
          r0 = nil
        else
          r0 = instantiate_node(VerseNumberNode,input, i0...index, s0)
        end

        node_cache[:verse_number][start_index] = r0

        r0
      end

      def _nt_start_fragment
        start_index = index
        if node_cache[:start_fragment].has_key?(index)
          cached = node_cache[:start_fragment][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        r1 = _nt_fragment
        if r1
          r0 = r1
        else
          r0 = instantiate_node(SyntaxNode,input, index...index)
        end

        node_cache[:start_fragment][start_index] = r0

        r0
      end

      def _nt_fragment
        start_index = index
        if node_cache[:fragment].has_key?(index)
          cached = node_cache[:fragment][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        s0, i0 = [], index
        loop do
          if has_terminal?('\G[^\\(\\)]', true, index)
            r1 = true
            @index += 1
          else
            r1 = nil
          end
          if r1
            s0 << r1
          else
            break
          end
        end
        if s0.empty?
          @index = i0
          r0 = nil
        else
          r0 = instantiate_node(FragmentNode,input, i0...index, s0)
        end

        node_cache[:fragment][start_index] = r0

        r0
      end

      module To0
        def cardinality
          elements[4]
        end

        def fragment
          elements[6]
        end

      end

      def _nt_to
        start_index = index
        if node_cache[:to].has_key?(index)
          cached = node_cache[:to][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i1, s1 = index, []
        if has_terminal?("(", false, index)
          r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure("(")
          r2 = nil
        end
        s1 << r2
        if r2
          s3, i3 = [], index
          loop do
            if has_terminal?('\G[\\s]', true, index)
              r4 = true
              @index += 1
            else
              r4 = nil
            end
            if r4
              s3 << r4
            else
              break
            end
          end
          r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
          s1 << r3
          if r3
            if has_terminal?("to", false, index)
              r5 = instantiate_node(SyntaxNode,input, index...(index + 2))
              @index += 2
            else
              terminal_parse_failure("to")
              r5 = nil
            end
            s1 << r5
            if r5
              s6, i6 = [], index
              loop do
                if has_terminal?('\G[\\s]', true, index)
                  r7 = true
                  @index += 1
                else
                  r7 = nil
                end
                if r7
                  s6 << r7
                else
                  break
                end
              end
              r6 = instantiate_node(SyntaxNode,input, i6...index, s6)
              s1 << r6
              if r6
                r8 = _nt_cardinality
                s1 << r8
                if r8
                  s9, i9 = [], index
                  loop do
                    if has_terminal?('\G[\\s]', true, index)
                      r10 = true
                      @index += 1
                    else
                      r10 = nil
                    end
                    if r10
                      s9 << r10
                    else
                      break
                    end
                  end
                  r9 = instantiate_node(SyntaxNode,input, i9...index, s9)
                  s1 << r9
                  if r9
                    r11 = _nt_fragment
                    s1 << r11
                    if r11
                      s12, i12 = [], index
                      loop do
                        if has_terminal?('\G[\\s]', true, index)
                          r13 = true
                          @index += 1
                        else
                          r13 = nil
                        end
                        if r13
                          s12 << r13
                        else
                          break
                        end
                      end
                      r12 = instantiate_node(SyntaxNode,input, i12...index, s12)
                      s1 << r12
                      if r12
                        if has_terminal?(")", false, index)
                          r14 = instantiate_node(SyntaxNode,input, index...(index + 1))
                          @index += 1
                        else
                          terminal_parse_failure(")")
                          r14 = nil
                        end
                        s1 << r14
                      end
                    end
                  end
                end
              end
            end
          end
        end
        if s1.last
          r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
          r1.extend(To0)
        else
          @index = i1
          r1 = nil
        end
        if r1
          r0 = r1
        else
          r0 = instantiate_node(SyntaxNode,input, index...index)
        end

        node_cache[:to][start_index] = r0

        r0
      end

      def _nt_cardinality
        start_index = index
        if node_cache[:cardinality].has_key?(index)
          cached = node_cache[:cardinality][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i1 = index
        if has_terminal?("1st", false, index)
          r2 = instantiate_node(SyntaxNode,input, index...(index + 3))
          @index += 3
        else
          terminal_parse_failure("1st")
          r2 = nil
        end
        if r2
          r1 = r2
        else
          if has_terminal?("2nd", false, index)
            r3 = instantiate_node(SyntaxNode,input, index...(index + 3))
            @index += 3
          else
            terminal_parse_failure("2nd")
            r3 = nil
          end
          if r3
            r1 = r3
          else
            if has_terminal?("3rd", false, index)
              r4 = instantiate_node(SyntaxNode,input, index...(index + 3))
              @index += 3
            else
              terminal_parse_failure("3rd")
              r4 = nil
            end
            if r4
              r1 = r4
            else
              @index = i1
              r1 = nil
            end
          end
        end
        if r1
          r0 = r1
        else
          r0 = instantiate_node(SyntaxNode,input, index...index)
        end

        node_cache[:cardinality][start_index] = r0

        r0
      end

    end

    class BibleParser < Treetop::Runtime::CompiledParser
      include Bible
    end


  end
end
