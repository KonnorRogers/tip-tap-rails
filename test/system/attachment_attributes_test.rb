require "application_system_test_case"

class AttachmentAttributesTest < ApplicationSystemTestCase
   test "visiting the index" do
     visit root_path

     assert_selector "h2", text: "TipTap Editor"
   end
end
