import { LitElement, html, css } from 'lit';
import { customElement, property } from 'lit/decorators.js';
import config from '$root/twind.config';
import install from '@twind/with-web-components';

@customElement('recipe-details-placeholder')
@install(config)
export default class extends LitElement {
  static styles = css`
    :host {
      width: 100%;
      height: 70%;
    }
  `;
  @property()
  calendarId?: string = '';

  override render() {
    return html`
      <div
        class="text-center border-2 py-4 border-dashed border-gray-300 rounded-xl h-full flex flex-col justify-center"
      >
        <div class="mx-auto h-12 w-12 text-gray-400">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 24 24"
            stroke-width="1.5"
            stroke="currentColor"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              d="M12 6.042A8.967 8.967 0 006 3.75c-1.052 0-2.062.18-3 .512v14.25A8.987 8.987 0 016 18c2.305 0 4.408.867 6 2.292m0-14.25a8.966 8.966 0 016-2.292c1.052 0 2.062.18 3 .512v14.25A8.987 8.987 0 0018 18a8.967 8.967 0 00-6 2.292m0-14.25v14.25"
            />
          </svg>
        </div>
        <h3 class="mt-2.text-sm.font-semibold.text-gray-900">
          Select a recipe from the left to assign to this day.
        </h3>
        <p class="mt-1 text-sm text-gray-500">
          Or you can create a new recipe from here.
        </p>
        <div class="mt-6">
          <a
            class="inline-flex items-center rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
            href="/recipes/new?calendar_id=${this.calendarId}"
          >
            <div class="h-5 w-5 -ml-0.5 mr-1.5">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                data-darkreader-inline-stroke=""
                style="--darkreader-inline-stroke: currentColor;"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M12 4.5v15m7.5-7.5h-15"
                ></path>
              </svg>
            </div>
            New recipe</a
          >
        </div>
      </div>
    `;
  }
}
