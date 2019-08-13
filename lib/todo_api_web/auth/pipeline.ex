defmodule TodoApiWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :busi_api,
                              module: TodoApiWeb.Auth.Guardian,
                              error_handler: TodoApiWeb.Auth.ErrorHandler

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
