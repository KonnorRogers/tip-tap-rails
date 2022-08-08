require "application_system_test_case"

class Selenium::WebDriver::ShadowRoot
  def tag_name
    "shadow-root"
  end
end

class AttachmentAttributesTest < ApplicationSystemTestCase
  def setup
    visit root_path
    assert_selector "h2", text: "TipTap Editor"

    @file_name = "view-layer-benchmarks.png"
  end

  def tip_tap_element
    find("tip-tap-element")
  end

  test "Attachment Attributes" do
    shadow_root = tip_tap_element.shadow_root
    shadow_root.find("#file-input", visible: false).attach_file(file_fixture(@file_name))

    tip_tap_figure = proc { shadow_root.find("figure.attachment.attachment--preview.attachment--png") }
    tip_tap_img = shadow_root.find("img")

    trix = find("trix-editor")

    page.attach_file(file_fixture(@file_name)) do
      find(".trix-button--icon-attach").click
    end

    trix_figure = proc { trix.find("figure.attachment.attachment--preview.attachment--png") }
    trix_img = trix.find("img")

    figure_attributes = ["class", "data-trix-content-type"]

    image_attributes = ["width", "height"]

    figure_attributes.each { |str| assert_equal tip_tap_figure.()[str], trix_figure.()[str] }

    attachment_attr = "data-trix-attachment"
    tip_tap_attachment_attrs = JSON.parse(tip_tap_figure.()[attachment_attr])
    trix_attachment_attrs = JSON.parse(trix_figure.()[attachment_attr])

    comparable_attributes = [
      "filename",
      "contentType",
      # "filesize",
      # "height",
      # "width"
    ]

    comparable_attributes.each do |attr|
      assert_equal tip_tap_attachment_attrs[attr], trix_attachment_attrs[attr]
    end

    puts rails_service_blob_path(":signed_id", ":filename")
    assert_match /\/rails\/active_storage\/blobs\/redirect\/\S+\//, tip_tap_attachment_attrs["url"]
    refute_nil tip_tap_attachment_attrs["sgid"]

    # Trix-attributes
    # attributes = "data-trix-attributes"
    # tip_tap_attributess = JSON.parse(tip_tap_figure.()[attributes])
    # trix_attributess = JSON.parse(trix_figure.()[attributes])
  end

end
