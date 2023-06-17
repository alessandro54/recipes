import Controller from '@/support/controller';
import { ActionEvent } from '@hotwired/stimulus';
import * as Turbo from '@hotwired/turbo';
// @ts-ignore
import Rails from '@rails/ujs';

export default class extends Controller {
  static targets = ['recipeList', 'recipeDetails', 'newRecipe', 'title', 'assign'];
  declare readonly recipeListTarget: HTMLDivElement;
  declare readonly recipeDetailsTarget: HTMLDivElement;
  declare readonly newRecipeTarget: HTMLDivElement;
  declare readonly titleTarget: HTMLHeadingElement;
  declare readonly assignTarget: HTMLAnchorElement;

  static values = { calendarId: String };
  declare readonly calendarIdValue: string;

  declare windowWidth: number;
  declare selectedRecipe: HTMLElement | null;
  declare selectedDate: string | null;

  connect () {
    this.windowWidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
    window.addEventListener('resize', this.handleResize);
  };

  public setDate ({ params }: ActionEvent): void {
    this.selectedDate = params.date;
    this.titleTarget.innerText = `Assign recipe for ${
      new Date(params.date.replace(/-/g, '\.')).toLocaleDateString('en-US', {
        weekday: 'long',
        month: 'long',
        day: 'numeric',
      })
    }`;
  }

  public selectRecipe (e: ActionEvent): void {
    if (this.selectedRecipe != null) {
      this.removeClass(this.selectedRecipe as HTMLElement, 'bg-indigo-200');
    }
    this.selectedRecipe = e.currentTarget as HTMLElement;
    this.addClass(this.selectedRecipe as HTMLElement, 'bg-indigo-200');
    if (this.windowWidth < 1024) {
      this.hide(this.recipeListTarget);
      this.show(this.recipeDetailsTarget);
    }
    this.show(this.assignTarget);
  };

  public createDay (e: ActionEvent): void {
    const url = new URL(e.params.url);
    const params = {
      day: {
        when: this.selectedDate,
        recipe_id: this.selectedRecipe!.id
      }
    };

    Rails.ajax({
      url: url.pathname,
      type: 'POST',
      headers: {
        Accept: 'text/vnd.turbo-stream.html',
      },
      beforeSend (xhr: any, options: any) {
        xhr.setRequestHeader('Content-Type', 'application/json; charset=UTF-8');
        options.data = JSON.stringify(params);
        return true;
      },
      success: (response: string) => {
        Turbo.visit(`/calendars/${this.calendarIdValue}/?date=${this.selectedDate}`, {
          action: 'replace',
          frame: 'calendar'
        });
        Turbo.renderStreamMessage(response);
        this.initialSetup();
      }
    });
  }

  public backToList (): void {
    this.selectedRecipe = null;
    this.show(this.recipeListTarget);
    this.hide(this.recipeDetailsTarget);
  }

  private handleResize = (): void => {
    this.windowWidth = window.innerWidth;
    if (this.windowWidth > 1024) {
      this.show(this.recipeListTarget);
      this.show(this.recipeDetailsTarget);
    }
    if (this.windowWidth < 1024) {
      if (this.selectedRecipe) {
        this.hide(this.recipeListTarget, 'flex');
        this.show(this.recipeDetailsTarget, 'flex');
      } else {
        this.show(this.recipeListTarget, 'flex');
        this.hide(this.recipeDetailsTarget, 'flex');
      }
    }
  };

  private initialSetup (): void {
    this.removeClass(this.selectedRecipe as HTMLElement, 'bg-indigo-200');
    this.hide(this.newRecipeTarget);
    document.getElementById('recipe-details')!.innerHTML = `
            <recipe-details-placeholder calendarId=${this.calendarIdValue}>
            </recipe-details-placeholder>
    `;
  }
}
