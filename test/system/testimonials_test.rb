require "application_system_test_case"

class TestimonialsTest < ApplicationSystemTestCase
  setup do
    @testimonial = testimonials(:one)
  end

  test "visiting the index" do
    visit testimonials_url
    assert_selector "h1", text: "Testimonials"
  end

  test "creating a Testimonial" do
    visit testimonials_url
    click_on "New Testimonial"

    fill_in "Accessories", with: @testimonial.accessories
    fill_in "Airblades", with: @testimonial.airblades
    fill_in "Category pages", with: @testimonial.category_pages
    fill_in "Description", with: @testimonial.description
    fill_in "Fans", with: @testimonial.fans
    fill_in "Homepage", with: @testimonial.homepage
    fill_in "Lighting", with: @testimonial.lighting
    fill_in "Testimonials", with: @testimonial.testimonials
    fill_in "Title", with: @testimonial.title
    fill_in "Vacuums", with: @testimonial.vacuums
    click_on "Create Testimonial"

    assert_text "Testimonial was successfully created"
    click_on "Back"
  end

  test "updating a Testimonial" do
    visit testimonials_url
    click_on "Edit", match: :first

    fill_in "Accessories", with: @testimonial.accessories
    fill_in "Airblades", with: @testimonial.airblades
    fill_in "Category pages", with: @testimonial.category_pages
    fill_in "Description", with: @testimonial.description
    fill_in "Fans", with: @testimonial.fans
    fill_in "Homepage", with: @testimonial.homepage
    fill_in "Lighting", with: @testimonial.lighting
    fill_in "Testimonials", with: @testimonial.testimonials
    fill_in "Title", with: @testimonial.title
    fill_in "Vacuums", with: @testimonial.vacuums
    click_on "Update Testimonial"

    assert_text "Testimonial was successfully updated"
    click_on "Back"
  end

  test "destroying a Testimonial" do
    visit testimonials_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Testimonial was successfully destroyed"
  end
end
