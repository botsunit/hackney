defmodule Hackney.Mixfile do
use Mix.Project

    def project do
        [
            app: :hackney,
            version: "1.6.1",
            description: "simple HTTP client for the Erlang VM",
            deps: deps(),
            package: package(),
            language: :erlang
        ]
    end

    def application do
        [
            applications:
                [
                    :kernel,
                    :stdlib,
                    :crypto,
                    :asn1,
                    :public_key,
                    :ssl,
                    :idna,
                    :mimerl,
                    :certifi,
                    :ssl_verify_fun,
                    :metrics
                ],
            env:
                [
                    {:timeout, 150000},
                    {:max_connections, 50},
                    {:restart, :permanent},
                    {:shutdown, 10000},
                    {:maxr, 10},
                    {:maxt, 1}
                ],
            mod: {:hackney_app, []}
        ]
    end

    def deps do
        [
            {:idna, "~> 1.2.0"},
            {:mimerl, "~> 1.0.2"},
            {:certifi, "~> 0.7.0"},
            # {:metrics, "~> 2.1.0"},
            {:metrics, git: "https://github.com/botsunit/erlang-metrics.git", tag: "2.2.0"},
            {:ssl_verify_fun, "1.1.1"}
        ]
    end

    defp package do
        [
            files: [
                "src",
                "include",
                "mix.exs",
                "mix.lock",
                "rebar.config",
                "rebar.lock",
                "README.md",
                "NEWS.md",
                "LICENSE",
                "NOTICE",
                "MAINTAINERS"
            ],
            maintainers: ["Benoit Chesneau", "Eduardo Gurgel"],
            licenses: ["Apache 2.0"],
            links: %{"Github" => "https://github.com/benoitc/hackney"}
        ]
    end
end
