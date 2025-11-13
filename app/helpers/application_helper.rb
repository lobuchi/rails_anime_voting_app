module ApplicationHelper
  include Pagy::Frontend

  def embed_youtube(anime)
    # Check if the video ID exists
    if anime.youtube_id.present?

      # The base embed URL format
      embed_url = "https://www.youtube.com/embed/#{anime.youtube_id}?rel=0"

      # Use content_tag to generate the <iframe> element
      content_tag(:iframe,
                  nil, # Inner content is nil
                  src: embed_url,
                  width: "100%",
                  height: "450",
                  frameborder: "0",
                  allowfullscreen: true)
    end
  end

end
