TestPerf::Application.routes.draw do
  get "/io-bound",  to: "pages#io_bound"
  get "/cpu-bound", to: "pages#cpu_bound"
end
