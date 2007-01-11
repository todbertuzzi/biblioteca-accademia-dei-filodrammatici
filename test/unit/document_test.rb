require File.dirname(__FILE__) + '/../test_helper'

class DocumentTest < Test::Unit::TestCase
  fixtures :authors, :documents, :responsibilities
  
  def test_names
    d = documents(:logica_umana)
    assert_equal 1, d.names.size
    assert_equal 'Mor, Carlo A.', d.names[0].name
    assert_equal 'IT\ICCU\ANAV\039809', d.names[0].id_sbn
  end
  
  def test_author
    d = documents(:logica_umana)
    assert_equal 'Mor, Carlo A.', d.author.name
    assert_equal 'IT\ICCU\ANAV\039809', d.author.id_sbn
  end
  
  def test_author_is_nil
    d = documents(:teatro_elisabettiano)
    assert_nil d.author, "teatro elisabettiano non ha un vero e proprio autore"
    assert_equal ['Praz, Mario'], d.names.map { |a| a.name }
  end

  def test_find_by_keywords_in_title
    assert_found_by_keywords [:teatro_elisabettiano], "elisabettiano"
    assert_found_by_keywords [:logica_umana], "logica umana"
    assert_found_by_keywords [:logica_umana], "dramma rappresentato per la prima volta a Genova"
  end
  
  def test_find_by_keywords_in_author
    assert_found_by_keywords [:logica_umana], "carlo"
    assert_found_by_keywords [:logica_umana], "Carlo Mor"
    # assert_found_by_keywords [:teatro_elisabettiano], "elisabettiano"
  end
  
private
  def assert_found_by_keywords(expected, keywords)
    actual = Document.find_by_keywords(keywords).map { |d| d.title }
    expected = expected.map { |sym| documents(sym).title }
    assert_equal expected, actual
  end
end
