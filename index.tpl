<!DOCTYPE html>
<html>
  <head>
    <title>Rancher Rodeo Helm Charts</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/2.10.0/github-markdown.min.css" />
    <style>
      .markdown-body {
        box-sizing: border-box;
        min-width: 200px;
        margin: 0 auto;
        padding: 45px;
      }
    
      @media (max-width: 767px) {
        .markdown-body {
          padding: 15px;
        }
      }

      .charts {
        display: flex;
        flex-wrap: wrap;
      }

      .chart {
        border-radius: 8px;
        overflow: hidden;
        border: 1px solid #d7d9dd;
        transition: transform .2s ease;
        background-color: #eaedef;
        width: 300px;
        margin: 0.5em;
      }
      
      .chart .icon {
        display: flex;
        justify-content: center;
        width: 100%;
        height: 110px;
        background-color: #fff;
        align-items: center;
      }
      .chart .icon img { 
        max-height: 80%;
      }
      .chart .body {
        position: relative;
        display: flex;
        justify-content: center;
        flex: 1;
        border-top: 1px solid #d7d9dd;
        padding: 0 1em;
        flex-direction: column;
        word-wrap: break-word;
        text-align: center;
      }
      .chart .body .info {
        word-wrap: break-word;
        text-align: center;
      }
      .chart .body .description {
        text-align: left;
      }
    </style>
    
  </head>

  <body>

    <section class="markdown-body">
      <h1>Rancher Rodeo Helm Charts</h1>

      <h2>Usage</h2>

      <pre class="snippet" lang="no-highlight"><code>helm repo add rodeo https://rancher.github.io/rodeo</code></pre>

      <p>This repository contains Helm charts that are used during Rancher Rodeo webinars and for demonstration purposes.</p>

      <p><b>The Helm charts in this repository are not production ready and are meant for demonstration purposes only!</b>

      <h2>Charts</h2>

      <div class="charts">
			{{range $key, $chartEntry := .Entries }}
        {{ if not (index $chartEntry 0).Deprecated }}
          <div class="chart">
            <div class="icon">
              <img class="chart-item-logo" alt="{{ $key }}'s logo" src="{{ if (index $chartEntry 0).Icon }}{{ (index $chartEntry 0).Icon }}{{ else }}_images/placeholder.png{{end}}">
            </div>
            <div class="body">
              <p class="info">
                <a href="{{ (index (index $chartEntry 0).Urls 0) }}" title="{{ (index (index $chartEntry 0).Urls 0) }}">
                  {{ (index $chartEntry 0).Name }}
                  ({{ (index $chartEntry 0).Version }}@{{ (index $chartEntry 0).AppVersion }})
                </a>
              </p>
              <p class="description">
                {{ (index $chartEntry 0).Description }}
              </p>
            </div>
          </div>
        {{end}}
			{{end}}
      </div>
    </section>
		<time datetime="{{ .Generated.Format "2006-01-02T15:04:05" }}" pubdate id="generated">{{ .Generated.Format "Mon Jan 2 2006 03:04:05PM MST-07:00" }}</time>
  </body>
</html>
