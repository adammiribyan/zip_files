jQuery ->
  ($ "button.download_zip_file").on "click", (event) ->
    button = ($ event.target)
    type = button.data "type"
    project_id = button.data "project-id"

    $.ajax(
      url: "/projects/#{project_id}/zip_url/#{type}",
      type: "get",
      success: (response) ->
        button.replaceWith "<span>#{response}</span>"
    )
